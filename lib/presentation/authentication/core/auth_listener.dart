import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/dialogs/adaptive_dialog.dart';
import 'package:refugee_help/presentation/core/utils/snackbars.dart';

class AuthListener extends StatelessWidget {
  final Widget child;

  const AuthListener({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) => state.maybeWhen(
          orElse: () => null,
          loading: (message) => showLoadingSnackBar(context, message: message),
          success: (message) => (message != null)
              ? showSuccessSnackBar(context, message: message)
              : ScaffoldMessenger.of(context).hideCurrentSnackBar(),
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
