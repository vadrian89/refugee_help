import 'package:flutter/material.dart';

class Head2Text extends StatelessWidget {
  final String text;

  const Head2Text({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: Theme.of(context).textTheme.headline2,
      );
}
