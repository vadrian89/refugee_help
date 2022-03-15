import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/infrastructure/validators.dart';

import '../../../core/widgets/text_fields/app_text_form_field.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? Function(String? errorMessage)? validator;

  const PasswordField({
    Key? key,
    this.controller,
    this.hintText,
    this.validator,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) => AppTextFormField(
        controller: widget.controller,
        hintText: widget.hintText ?? "password".tr(),
        validator: widget.validator ??
            (val) => Validators.isValidPassword(val) ? null : "password_req".tr(),
        obscureText: _obscure,
        suffixIcon: IconButton(
          icon: Icon(_obscure ? MdiIcons.eye : MdiIcons.eyeOutline),
          onPressed: () => setState(() => _obscure = !_obscure),
        ),
      );
}
