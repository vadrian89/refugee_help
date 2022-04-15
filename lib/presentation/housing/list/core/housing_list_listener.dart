import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/housing/list/list_housing_cubit.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/dialogs/adaptive_dialog.dart';
import 'package:refugee_help/presentation/core/utils/snackbars.dart';

class HousingListListener extends StatelessWidget {
  final Widget child;

  const HousingListListener({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocListener<ListHousingCubit, ListHousingState>(
        listener: (context, state) => state.maybeWhen(
          orElse: () => null,
          deleting: () => showLoadingSnackBar(context, message: "deleting".tr()),
          success: (message) {
            message.isNotEmpty
                ? showSuccessSnackBar(context, message: message)
                : ScaffoldMessenger.of(context).hideCurrentSnackBar();
            return;
          },
          failure: (message) => AdaptiveDialog.showError(context, message: message),
          loading: (message) => showLoadingSnackBar(context, message: message),
        ),
        listenWhen: (_, current) => current.maybeWhen(
          orElse: () => false,
          deleting: () => true,
          success: (_) => true,
          failure: (_) => true,
          loading: (message) => message.isNotEmpty,
        ),
        child: child,
      );
}
