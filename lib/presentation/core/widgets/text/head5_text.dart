import 'package:flutter/material.dart';

class Head5Text extends StatelessWidget {
  final String text;

  const Head5Text({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: Theme.of(context).textTheme.headline5,
      );
}
