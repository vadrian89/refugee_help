import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
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
  final int? minLines;
  final int? maxLines;
  final void Function(String? value)? onSaved;

  const AppTextFormField({
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
    this.minLines,
    this.maxLines = 1,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextFormField(
        initialValue: initialValue,
        controller: controller,
        decoration: InputDecoration(
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
        minLines: minLines,
        maxLines: maxLines,
        onSaved: onSaved,
      );
}
