import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/infrastructure/validators.dart';

import 'auth_text_field.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController? controller;

  const PasswordField({Key? key, this.controller}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) => AuthTextField(
        controller: widget.controller,
        hintText: "password".tr(),
        validator: (val) => Validators.isValidPassword(val) ? null : "password_req".tr(),
        obscureText: _obscure,
        suffixIcon: IconButton(
          icon: Icon(_obscure ? MdiIcons.eye : MdiIcons.eyeOutline),
          onPressed: () => setState(() => _obscure = !_obscure),
        ),
      );
}
