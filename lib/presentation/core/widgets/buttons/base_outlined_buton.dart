import 'package:flutter/material.dart';

import 'button_body_with_icon.dart';

/// A custom [OutlinedButton] which is used throughout this app.
///
/// This way, in case a breaking change occurs in Flutter to [OutlinedButton], we can easily address it in our app.
class BaseOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;
  final Widget child;

  const BaseOutlinedButton({
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
  factory BaseOutlinedButton.icon({
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
      BaseOutlinedButton(
        child: ButtonBodyWithIcon(label: label, icon: icon),
        style: style,
        focusNode: focusNode,
        autofocus: autofocus,
        clipBehavior: clipBehavior,
        onPressed: onPressed,
        onLongPress: onLongPress,
      );

  @override
  Widget build(BuildContext context) => OutlinedButton(
        child: child,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus,
        clipBehavior: clipBehavior,
        onPressed: onPressed,
        onLongPress: onLongPress,
      );
}
