import 'package:flutter/material.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/base_text_buton.dart';
import 'package:refugee_help/presentation/core/widgets/text/sub2_text.dart';

class MessageButton extends StatelessWidget {
  final String message;
  final String buttonLabel;
  final VoidCallback? onPressed;

  const MessageButton({
    Key? key,
    required this.message,
    required this.buttonLabel,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Sub2Text(text: message),
          BaseTextButton(
            child: Sub2Text(
              text: buttonLabel,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
            onPressed: onPressed,
          ),
        ],
      );
}
