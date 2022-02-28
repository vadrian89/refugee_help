import 'package:flutter/material.dart';

class Body2Text extends StatelessWidget {
  final String text;

  const Body2Text({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: Theme.of(context).textTheme.bodyText2,
      );
}
