import 'package:flutter/material.dart';

class BaseTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final InputDecoration? inputDecoration;
  final bool readOnly;
  final void Function(String value)? onChanged;
  final String? Function(String? errorMessage)? validator;
  final AutovalidateMode autovalidateMode;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? initialValue;

  const BaseTextFormField({
    Key? key,
    this.controller,
    this.focusNode,
    this.inputDecoration,
    this.readOnly = false,
    this.onChanged,
    this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.keyboardType,
    this.obscureText = false,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextFormField(
        initialValue: initialValue,
        controller: controller,
        focusNode: focusNode,
        decoration: inputDecoration,
        readOnly: readOnly,
        validator: validator,
        autovalidateMode: autovalidateMode,
        onChanged: onChanged,
        keyboardType: keyboardType,
        obscureText: obscureText,
      );
}
