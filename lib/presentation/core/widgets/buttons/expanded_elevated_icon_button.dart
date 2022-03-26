import 'package:flutter/material.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/base_elevated_buton.dart';

class ExpandedElevatedIconButton extends StatelessWidget {
  final String label;
  final Widget icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const ExpandedElevatedIconButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: BaseElevatedButton.icon(
              label: Text(label),
              icon: icon,
              onPressed: onPressed,
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 16)),
                backgroundColor: MaterialStateProperty.all(backgroundColor),
                foregroundColor: MaterialStateProperty.all(foregroundColor),
              ),
            ),
          ),
        ],
      );
}
