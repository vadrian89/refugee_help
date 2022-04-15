import 'package:flutter/material.dart';

import 'refocus_background.dart';

class ConstrainedForm extends StatelessWidget {
  final GlobalKey<FormState>? formKey;
  final List<Widget> children;
  final AutovalidateMode autovalidateMode;

  const ConstrainedForm({
    Key? key,
    this.formKey,
    required this.children,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => RefocusBackground(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shrinkWrap: true,
                children: children,
              ),
            ),
          ),
        ),
      );
}
