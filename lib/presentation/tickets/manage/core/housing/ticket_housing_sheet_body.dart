import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/application/housing/list/list_housing_cubit.dart';
import 'package:refugee_help/domain/housing/list_housing_request_model.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/dialogs/adaptive_dialog.dart';
import 'package:refugee_help/presentation/core/widgets/loader_widget.dart';
import 'package:refugee_help/presentation/core/widgets/no_data_placeholder.dart';
import 'package:refugee_help/presentation/core/widgets/text_fields/app_text_form_field.dart';
import 'package:refugee_help/presentation/core/widgets/vertical_spacing.dart';
import 'package:refugee_help/presentation/tickets/manage/core/housing/sheet_search_housing_button.dart';
import 'package:refugee_help/presentation/tickets/manage/core/housing/ticket_housing_sheet_tile.dart';

class TicketHousingSheetBody extends StatefulWidget {
  const TicketHousingSheetBody({Key? key}) : super(key: key);

  @override
  State<TicketHousingSheetBody> createState() => _TicketHousingSheetBodyState();
}

class _TicketHousingSheetBodyState extends State<TicketHousingSheetBody> {
  late ListHousingCubit _bloc;
  late final ScrollController _controller;
  int _currentPage = 1;
  int _totalRows = 0;

  int get _pageLimit => _currentPage * 10;

  ListHousingRequestModel _request = const ListHousingRequestModel(isAvailable: true);

  @override
  void initState() {
    super.initState();
    _request = _request.copyWith(limit: _pageLimit);
    _controller = ScrollController()..addListener(_scrollEventListener);
    _bloc = ListHousingCubit(authCubit: context.read<AuthenticationCubit>());
    _fetch();
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollEventListener);
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextFormField(
            hintText: "beds_available".tr(),
            keyboardType: TextInputType.number,
            onChanged: (val) => _request = _request.copyWith(
              bedsAvailable: int.tryParse(val),
            ),
          ),
          const VerticalSpacing(20),
          SheetSearchHousingButton(bloc: _bloc, onSearch: _fetch),
          const VerticalSpacing(40),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.5),
            child: BlocConsumer<ListHousingCubit, ListHousingState>(
              bloc: _bloc,
              listener: (context, state) => state.maybeWhen(
                orElse: () => null,
                failure: (message) => AdaptiveDialog.showError(context, message: message),
              ),
              listenWhen: (_, current) => current.maybeWhen(
                orElse: () => false,
                failure: (_) => true,
              ),
              builder: (context, state) => state.maybeWhen(
                orElse: () => const LoaderWidget(),
                view: (list) {
                  _totalRows = list.length;

                  if (list.isEmpty) {
                    return const NoDataPlaceholder();
                  }
                  return ListView.builder(
                    controller: _controller,
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context, index) => TicketHousingSheetTile(
                      housing: list[index],
                      onPressed: (model) => Navigator.maybePop(context, model),
                    ),
                  );
                },
              ),
              buildWhen: (_, current) => current.maybeWhen(orElse: () => false, view: (_) => true),
            ),
          ),
        ],
      );

  void _scrollEventListener() {
    if (_controller.position.pixels > 0 &&
        _controller.position.pixels == _controller.position.maxScrollExtent &&
        _pageLimit <= _totalRows) {
      _currentPage++;
      _fetch();
    }
  }

  void _fetch() => _bloc.fetchList(
        _request.copyWith(limit: _pageLimit),
        all: true,
      );
}
