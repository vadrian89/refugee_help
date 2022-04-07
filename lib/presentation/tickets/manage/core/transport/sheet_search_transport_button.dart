import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/application/transport/list/list_transport_cubit.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/circular_progress_elevated_button.dart';

class SheetSearchTransportButton extends StatelessWidget {
  final ListTransportCubit bloc;
  final VoidCallback onSearch;

  const SheetSearchTransportButton({Key? key, required this.onSearch, required this.bloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<ListTransportCubit, ListTransportState>(
        bloc: bloc,
        builder: (context, state) {
          final isSearching = state.maybeWhen(orElse: () => false, loading: (_) => true);
          return CircularProgressElevatedButton(
            label: "search".tr(),
            icon: const Icon(MdiIcons.magnify),
            isLoading: isSearching,
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());
              isSearching ? null : onSearch();
            },
          );
        },
      );
}
