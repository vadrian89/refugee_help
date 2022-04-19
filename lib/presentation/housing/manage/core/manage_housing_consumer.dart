import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/housing/manage/manage_housing_cubit.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/dialogs/adaptive_dialog.dart';
import 'package:refugee_help/presentation/core/utils/snackbars.dart';
import 'package:refugee_help/presentation/core/widgets/loader_widget.dart';

class ManageHousingConsumer extends StatelessWidget {
  final Widget Function(BuildContext context, ManageHousingState state) builder;

  const ManageHousingConsumer({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocConsumer<ManageHousingCubit, ManageHousingState>(
        listener: (context, state) => state.maybeWhen(
          orElse: () => null,
          loading: (message) => showLoadingSnackBar(context, message: message),
          success: (message, popScreen) => (message != null && !popScreen)
              ? showSuccessSnackBar(context, message: message)
              : Navigator.maybePop(context),
          failure: (message) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            return AdaptiveDialog.showError(context, message: message);
          },
        ),
        listenWhen: (_, current) => current.maybeMap(
          orElse: () => false,
          loading: (_) => true,
          success: (_) => true,
          failure: (_) => true,
        ),
        builder: (context, state) {
          final isInitial = state.maybeWhen(orElse: () => false, initial: () => true);
          if (isInitial) {
            return const LoaderWidget();
          }
          return builder(context, state);
        },
        buildWhen: (_, current) => current.maybeMap(
          orElse: () => false,
          view: (_) => true,
          edit: (_) => true,
        ),
      );
}
