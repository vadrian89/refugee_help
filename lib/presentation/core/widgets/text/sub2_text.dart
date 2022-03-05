import 'package:flutter/material.dart';

class Sub2Text extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;

  const Sub2Text({
    Key? key,
    required this.text,
    this.color,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: Theme.of(context).textTheme.subtitle2?.copyWith(
              color: color,
              fontWeight: fontWeight,
            ),
      );
}
