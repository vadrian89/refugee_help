import 'package:flutter/material.dart';

class Head1Text extends StatelessWidget {
  final String text;

  const Head1Text({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: Theme.of(context).textTheme.headline1,
      );
}
