import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/adaptive_widget.dart';

class AdaptiveDialogAction extends AdaptiveWidget {
  final Widget child;
  final VoidCallback onPressed;

  const AdaptiveDialogAction({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget cupertinoBuild(BuildContext context) => CupertinoDialogAction(
        child: child,
        onPressed: onPressed,
      );

  @override
  Widget materialBuild(BuildContext context) => TextButton(
        child: child,
        onPressed: onPressed,
      );
}
