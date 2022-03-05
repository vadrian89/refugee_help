import 'package:flutter/material.dart';

class Head6Text extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;

  const Head6Text({
    Key? key,
    required this.text,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: Theme.of(context).textTheme.headline6,
        textAlign: textAlign,
      );
}
