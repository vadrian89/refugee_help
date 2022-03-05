import 'package:flutter/material.dart';

class Sub1Text extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;

  const Sub1Text({Key? key, required this.text, this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: Theme.of(context).textTheme.subtitle1,
        textAlign: textAlign,
      );
}
