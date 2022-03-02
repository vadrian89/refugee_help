import 'package:flutter/material.dart';

class Head4Text extends StatelessWidget {
  final String text;

  const Head4Text({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: Theme.of(context).textTheme.headline3,
      );
}
