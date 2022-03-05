import 'package:flutter/material.dart';

class VerticalSpacing extends StatelessWidget {
  final double height;

  const VerticalSpacing([this.height = 10, Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(height: height);
}
