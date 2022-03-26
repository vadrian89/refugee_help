import 'package:flutter/material.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/base_elevated_buton.dart';

class CircularProgressElevatedButton extends StatelessWidget {
  final String label;
  final Widget icon;
  final bool isLoading;
  final VoidCallback onPressed;

  const CircularProgressElevatedButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: BaseElevatedButton.icon(
              label: Text(label),
              icon: _icon(context),
              onPressed: onPressed,
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size.fromHeight(48)),
              ),
            ),
          ),
        ],
      );

  Widget _icon(BuildContext context) => isLoading
      ? Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: FittedBox(
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color?>(Theme.of(context).colorScheme.onPrimary),
              ),
            ),
          ),
        )
      : icon;
}
