import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/user/user_cubit.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/dialogs/adaptive_dialog.dart';
import 'package:refugee_help/presentation/core/utils/snackbars.dart';

class UserProfileListener extends StatelessWidget {
  final Widget child;

  const UserProfileListener({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocListener<UserCubit, UserState>(
        listener: (context, state) => state.maybeWhen(
          orElse: () => null,
          loading: (message) => showLoadingSnackBar(context, message: message),
          success: (message) =>
              (message != null) ? showSuccessSnackBar(context, message: message) : null,
          failure: (message) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            return AdaptiveDialog.showError(context, message: message);
          },
        ),
        listenWhen: (_, current) => current.maybeWhen(
          orElse: () => false,
          loading: (_) => true,
          success: (_) => true,
          failure: (_) => true,
        ),
        child: child,
      );
}
