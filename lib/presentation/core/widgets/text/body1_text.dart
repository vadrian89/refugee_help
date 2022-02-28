import 'package:flutter/material.dart';

class Body1Text extends StatelessWidget {
  final String text;

  const Body1Text({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      );
}
