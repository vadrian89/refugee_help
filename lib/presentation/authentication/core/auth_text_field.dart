import 'package:flutter/material.dart';
import 'package:refugee_help/presentation/core/widgets/text_fields/base_text_form_field.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String? errorMessage)? validator;
  final String? hintText;
  final String? labelText;
  final void Function(String value)? onChanged;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;

  const AuthTextField({
    Key? key,
    this.controller,
    this.validator,
    this.onChanged,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseTextFormField(
        controller: controller,
        inputDecoration: InputDecoration(
          hintText: hintText,
          labelText: labelText ?? hintText,
          errorMaxLines: 3,
          suffixIcon: suffixIcon,
        ),
        keyboardType: keyboardType,
        validator: validator,
        onChanged: onChanged,
        obscureText: obscureText,
      );
}
