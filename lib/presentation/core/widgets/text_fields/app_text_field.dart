import 'package:flutter/material.dart';
import 'package:refugee_help/presentation/core/widgets/text_fields/base_text_form_field.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String? errorMessage)? validator;
  final String? hintText;
  final String? labelText;
  final void Function(String value)? onChanged;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final AutovalidateMode autovalidateMode;
  final bool readOnly;
  final String? initialValue;

  const AppTextField({
    Key? key,
    this.controller,
    this.validator,
    this.onChanged,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.readOnly = false,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseTextFormField(
        initialValue: initialValue,
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
        autovalidateMode: autovalidateMode,
        readOnly: readOnly,
      );
}
