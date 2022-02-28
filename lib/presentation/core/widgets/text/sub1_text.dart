import 'package:flutter/material.dart';

class Sub1Text extends StatelessWidget {
  final String text;

  const Sub1Text({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: Theme.of(context).textTheme.subtitle1,
      );
}
