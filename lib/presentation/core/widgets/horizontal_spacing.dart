import 'package:flutter/material.dart';

class HorizontalSpacing extends StatelessWidget {
  final double width;

  const HorizontalSpacing([this.width = 10, Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(width: width);
}
