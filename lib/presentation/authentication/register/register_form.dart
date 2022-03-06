import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/authentication/register/register_cubit.dart';
import 'package:refugee_help/domain/user/user_category_model.dart';
import 'package:refugee_help/domain/user/user_model.dart';
import 'package:refugee_help/infrastructure/validators.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/dialogs/adaptive_dialog.dart';
import 'package:refugee_help/presentation/core/widgets/refocus_background.dart';
import 'package:refugee_help/presentation/core/widgets/text/head6_text.dart';
import 'package:refugee_help/presentation/core/widgets/vertical_spacing.dart';

import '../core/buttons/expanded_elevated_button.dart';
import '../../core/widgets/text_fields/app_text_field.dart';
import '../core/text_fields/password_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late final TextEditingController _lastNameController;
  late final TextEditingController _firstNameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _passwordConfirmController;

  String get _lastName => _lastNameController.text;
  String get _firstName => _firstNameController.text;
  String get _phone => _phoneController.text;
  String get _email => _emailController.text;
  String get _password => _passwordController.text;
  String get _passwordConfirm => _passwordConfirmController.text;

  bool get _isFilled =>
      _lastName.isNotEmpty &&
      _firstName.isNotEmpty &&
      _phone.isNotEmpty &&
      _email.isNotEmpty &&
      _password.isNotEmpty &&
      _passwordConfirm.isNotEmpty;

  bool get _isValid =>
      Validators.isValidPhone(_phone) &&
      Validators.isValidEmail(_email) &&
      Validators.isValidPassword(_password) &&
      (_passwordConfirm == _password);

  UserModel get _user => UserModel(
        lastName: _lastName,
        firstName: _firstName,
        phone: _phone,
        email: _email,
        password: _password,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        category: UserCategoryModel.volunteer(),
      );

  @override
  void initState() {
    super.initState();
    _lastNameController = TextEditingController();
    _firstNameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordConfirmController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _lastNameController.dispose();
    _firstNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
  }

  @override
  Widget build(BuildContext context) => RefocusBackground(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 36),
              children: [
                const Center(child: FlutterLogo(size: 80)),
                const VerticalSpacing(60),
                Head6Text(text: "create_your_account".tr()),
                const VerticalSpacing(),
                AppTextField(
                  controller: _lastNameController,
                  hintText: "last_name".tr(),
                  autovalidateMode: AutovalidateMode.always,
                  validator: (val) => (val?.isNotEmpty ?? false) ? null : "field_empty_error".tr(),
                ),
                AppTextField(
                  controller: _firstNameController,
                  hintText: "first_name".tr(),
                  autovalidateMode: AutovalidateMode.always,
                  validator: (val) => (val?.isNotEmpty ?? false) ? null : "field_empty_error".tr(),
                ),
                AppTextField(
                  controller: _phoneController,
                  hintText: "phone".tr(),
                  validator: (val) => Validators.isValidPhone(val) ? null : "phone_invalid".tr(),
                  keyboardType: TextInputType.phone,
                ),
                AppTextField(
                  controller: _emailController,
                  hintText: "E-mail",
                  validator: (val) => Validators.isValidEmail(val) ? null : "email_invalid".tr(),
                  keyboardType: TextInputType.emailAddress,
                ),
                PasswordField(
                  controller: _passwordController,
                ),
                PasswordField(
                  controller: _passwordConfirmController,
                  hintText: "confirm_password".tr(),
                  validator: (val) =>
                      (_password == _passwordConfirm) ? null : "password_confirm_mismatch".tr(),
                ),
                const VerticalSpacing(20),
                ExpandedElevatedButton(
                  label: "sign_up".tr(),
                  onPressed: () {
                    if (!_isFilled) {
                      AdaptiveDialog.showError(context, message: "form_not_completed".tr());
                      return;
                    }
                    if (!_isValid) {
                      AdaptiveDialog.showError(context, message: "form_is_not_valid".tr());
                      return;
                    }
                    context.read<RegisterCubit>().registerUser(_user);
                  },
                ),
                const VerticalSpacing(40),
              ],
            ),
          ),
        ),
      );
}
