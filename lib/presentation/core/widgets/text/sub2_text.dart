import 'package:flutter/material.dart';

class Sub2Text extends StatelessWidget {
  final String text;

  const Sub2Text({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: Theme.of(context).textTheme.subtitle2,
      );
}
