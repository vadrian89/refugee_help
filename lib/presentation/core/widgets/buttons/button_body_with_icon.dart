import 'dart:ui';
import 'dart:math' as math;
import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

/// Code copied from [ElevatedButton.icon] redirected constructor to use for layouting the icon and label.
class ButtonBodyWithIcon extends StatelessWidget {
  final Widget label;
  final Widget icon;

  const ButtonBodyWithIcon({Key? key, required this.label, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double scale = MediaQuery.maybeOf(context)?.textScaleFactor ?? 1;
    final double gap = scale <= 1 ? 8 : lerpDouble(8, 4, math.min(scale - 1, 1))!;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[icon, SizedBox(width: gap), Flexible(child: label)],
    );
  }
}
