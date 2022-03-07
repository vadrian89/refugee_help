import 'package:flutter/material.dart';

class BaseIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;
  final Color? color;

  const BaseIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(
        icon: icon,
        onPressed: onPressed,
        color: color,
      );
}
