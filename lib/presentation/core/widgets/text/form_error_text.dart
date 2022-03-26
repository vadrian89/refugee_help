import 'package:flutter/material.dart';

class FormErrorText extends StatelessWidget {
  final String text;

  const FormErrorText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: TextStyle(color: Theme.of(context).errorColor, fontSize: 12),
      );
}
