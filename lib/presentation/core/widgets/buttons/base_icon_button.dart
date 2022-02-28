import 'package:flutter/material.dart';

class BaseIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;

  const BaseIconButton({Key? key, required this.icon, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(
        icon: icon,
        onPressed: onPressed,
      );
}
