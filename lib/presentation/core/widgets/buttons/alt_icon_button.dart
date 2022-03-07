import 'package:flutter/material.dart';

import 'base_icon_button.dart';

class AltIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const AltIconButton({Key? key, required this.icon, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseIconButton(
        icon: Icon(icon),
        onPressed: onPressed,
        color: Theme.of(context).primaryColor,
      );
}
