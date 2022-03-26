import 'package:flutter/material.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/base_elevated_buton.dart';

class ExpandedElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Color? backgroundColor;

  const ExpandedElevatedButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: BaseElevatedButton(
              child: Text(label),
              onPressed: onPressed,
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 16)),
                backgroundColor: MaterialStateProperty.all(backgroundColor),
              ),
            ),
          ),
        ],
      );
}
