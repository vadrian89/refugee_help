import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/application/transport/list/list_transport_cubit.dart';
import 'package:refugee_help/domain/transport/list_transport_request_model.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/dialogs/adaptive_dialog.dart';
import 'package:refugee_help/presentation/core/widgets/loader_widget.dart';
import 'package:refugee_help/presentation/core/widgets/no_data_placeholder.dart';
import 'package:refugee_help/presentation/core/widgets/text_fields/app_text_form_field.dart';
import 'package:refugee_help/presentation/core/widgets/vertical_spacing.dart';
import 'package:refugee_help/presentation/tickets/manage/core/transport/sheet_search_transport_button.dart';
import 'package:refugee_help/presentation/tickets/manage/core/transport/ticket_transport_sheet_tile.dart';
import 'package:refugee_help/presentation/transport/manage/core/transport_type_dropdown.dart';

class TicketTransportSheetBody extends StatefulWidget {
  const TicketTransportSheetBody({Key? key}) : super(key: key);

  @override
  State<TicketTransportSheetBody> createState() => _TicketTransportSheetBodyState();
}

class _TicketTransportSheetBodyState extends State<TicketTransportSheetBody> {
  ListTransportRequestModel _request = const ListTransportRequestModel();
  late ListTransportCubit _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ListTransportCubit(
      authCubit: context.read<AuthenticationCubit>(),
    )..fetchList(_request);
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextFormField(
            hintText: "seats_available".tr(),
            keyboardType: TextInputType.number,
            onChanged: (val) => _request = _request.copyWith(
              seatsAvailable: int.tryParse(val),
            ),
          ),
          const VerticalSpacing(20),
          TransportTypeDropdown(
            value: _request.transportType,
            onChanged: (val) => setState(
              () => _request = _request.copyWith(transportType: val),
            ),
          ),
          const VerticalSpacing(20),
          SheetSearchTransportButton(
            bloc: _bloc,
            onSearch: () => _bloc.fetchList(_request),
          ),
          const VerticalSpacing(40),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.5),
            child: BlocConsumer<ListTransportCubit, ListTransportState>(
              bloc: _bloc,
              listener: (context, state) => state.maybeWhen(
                orElse: () => null,
                failure: (message) => AdaptiveDialog.showError(context, message: message),
              ),
              listenWhen: (_, current) => current.maybeWhen(
                orElse: () => false,
                failure: (_) => true,
              ),
              builder: (context, state) => state.maybeMap(
                orElse: () => const LoaderWidget(),
                view: (view) {
                  if (view.list.isEmpty) {
                    return const NoDataPlaceholder();
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: view.list.length,
                    itemBuilder: (context, index) => TicketTransportSheetTile(
                      transport: view.list[index],
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
}
