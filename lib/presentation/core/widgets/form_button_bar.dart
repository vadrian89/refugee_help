import 'package:flutter/material.dart';

import 'buttons/cancel_button.dart';
import 'buttons/save_button.dart';

class FormButtonBar extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onSave;
  final EdgeInsets padding;
  final bool visible;

  const FormButtonBar({
    Key? key,
    required this.onCancel,
    required this.onSave,
    this.padding = const EdgeInsets.symmetric(vertical: 20),
    this.visible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Visibility(
        visible: visible,
        child: Padding(
          padding: padding,
          child: ButtonBar(
            children: [
              CancelButton(onCancel: onCancel),
              SaveButton(onSave: onSave),
            ],
          ),
        ),
      );
}
