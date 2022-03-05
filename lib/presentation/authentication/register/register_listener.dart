import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/authentication/register/register_cubit.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/dialogs/adaptive_dialog.dart';
import 'package:refugee_help/presentation/core/utils/snackbars.dart';

class RegisterListener extends StatelessWidget {
  final Widget child;

  const RegisterListener({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) => state.maybeWhen(
          orElse: () => null,
          registering: () => showLoadingSnackBar(context, message: "registering_user".tr()),
          failure: (message) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            return AdaptiveDialog.showError(context, message: message);
          },
        ),
        listenWhen: (_, current) => current.maybeWhen(
          orElse: () => false,
          registering: () => true,
          failure: (_) => true,
        ),
        child: child,
      );
}
