import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/infrastructure/validators.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/dialogs/adaptive_dialog.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/base_text_buton.dart';
import 'package:refugee_help/presentation/core/widgets/text/head6_text.dart';
import 'package:refugee_help/presentation/core/widgets/vertical_spacing.dart';

import '../../core/widgets/buttons/expanded_elevated_button.dart';
import '../../core/widgets/text_fields/app_text_form_field.dart';
import 'text_fields/password_field.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  String get _email => _emailController.text;
  String get _password => _passwordController.text;

  bool get _isFilled => _email.isNotEmpty && _password.isNotEmpty;
  bool get _isValid => Validators.isValidEmail(_email) && Validators.isValidPassword(_password);

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpacing(60),
          Head6Text(text: "sign_in_to_your_account".tr()),
          const VerticalSpacing(),
          AppTextFormField(
            controller: _emailController,
            hintText: "E-mail",
            validator: (val) => Validators.isValidEmail(val) ? null : "email_invalid".tr(),
            keyboardType: TextInputType.emailAddress,
          ),
          const VerticalSpacing(),
          PasswordField(
            controller: _passwordController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BaseTextButton(
                child: Text("reset_password".tr()),
                onPressed: () {
                  if (!Validators.isValidEmail(_email)) {
                    AdaptiveDialog.showError(context, message: "email_invalid".tr());
                    return;
                  }
                  context.read<AuthenticationCubit>().resetPassword(_email);
                },
              ),
            ],
          ),
          const VerticalSpacing(),
          ExpandedElevatedButton(
            label: "sign_in".tr(),
            onPressed: () {
              if (!_isFilled) {
                AdaptiveDialog.showError(context, message: "form_not_completed".tr());
                return;
              }
              if (!_isValid) {
                AdaptiveDialog.showError(context, message: "form_is_not_valid".tr());
                return;
              }
              context.read<AuthenticationCubit>().signInWithEmail(
                    email: _email,
                    password: _password,
                  );
            },
          ),
          const VerticalSpacing(40),
        ],
      );
}
