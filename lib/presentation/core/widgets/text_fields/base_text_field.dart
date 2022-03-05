import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final InputDecoration? inputDecoration;
  final bool readOnly;

  const BaseTextField({
    Key? key,
    this.controller,
    this.focusNode,
    this.inputDecoration,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        focusNode: focusNode,
        decoration: inputDecoration,
        readOnly: readOnly,
      );
}
