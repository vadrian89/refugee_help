import 'dart:math' as math;
import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

/// A custom [ElevatedButton] which is used throughout this app.
///
/// This way, in case a breaking change occurs in Flutter to [ElevatedButton], we can easily address it in our app.
class BaseElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;
  final Widget child;

  const BaseElevatedButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.onLongPress,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
  }) : super(key: key);

  /// A factory constructor which takes an aditional icon to show along with the label.
  factory BaseElevatedButton.icon({
    Key? key,
    required Widget label,
    required Widget icon,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
  }) =>
      BaseElevatedButton(
        child: _ElevatedButtonWithIcon(label: label, icon: icon),
        style: style,
        focusNode: focusNode,
        autofocus: autofocus,
        clipBehavior: clipBehavior,
        onPressed: onPressed,
        onLongPress: onLongPress,
      );

  @override
  Widget build(BuildContext context) => ElevatedButton(
        child: child,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus,
        clipBehavior: clipBehavior,
        onPressed: onPressed,
        onLongPress: onLongPress,
      );
}

/// Code copied from [ElevatedButton.icon] redirected constructor to use for layouting the icon and label.
class _ElevatedButtonWithIcon extends StatelessWidget {
  final Widget label;
  final Widget icon;

  const _ElevatedButtonWithIcon({Key? key, required this.label, required this.icon})
      : super(key: key);

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
