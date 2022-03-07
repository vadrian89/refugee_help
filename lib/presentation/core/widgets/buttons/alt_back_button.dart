import 'package:flutter/material.dart';

class AltBackButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const AltBackButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) => BackButton(
        onPressed: onPressed,
        color: Theme.of(context).primaryColor,
      );
}
