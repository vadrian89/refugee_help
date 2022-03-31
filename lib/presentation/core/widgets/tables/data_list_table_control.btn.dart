import 'package:flutter/material.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/base_icon_button.dart';

class DataListTableControlBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const DataListTableControlBtn({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseIconButton(
        icon: Icon(icon),
        splashRadius: 20,
        onPressed: onPressed,
      );
}
