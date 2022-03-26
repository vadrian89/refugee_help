import 'package:flutter/material.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/base_elevated_buton.dart';

class ElevatedIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final ButtonStyle? style;

  const ElevatedIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseElevatedButton(
        child: Icon(icon),
        style: (style ?? const ButtonStyle()).copyWith(
          shape: MaterialStateProperty.all(const CircleBorder()),
        ),
        onPressed: onPressed,
      );
}
