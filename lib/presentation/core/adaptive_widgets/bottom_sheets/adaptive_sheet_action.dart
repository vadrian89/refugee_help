import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/buttons/base_elevated_buton.dart';
import '../core/adaptive_widget.dart';

class AdaptiveSheetAction extends AdaptiveWidget {
  final Widget child;
  final VoidCallback onPressed;
  final ButtonStyle? materialStyle;
  final bool useTextButton;

  const AdaptiveSheetAction({
    Key? key,
    required this.child,
    required this.onPressed,
    this.materialStyle,
    this.useTextButton = false,
  }) : super(key: key);

  @override
  Widget cupertinoBuild(BuildContext context) => CupertinoActionSheetAction(
        child: child,
        onPressed: onPressed,
      );

  @override
  Widget materialBuild(BuildContext context) => useTextButton ? _textButton : _elevatedButton;

  Widget get _elevatedButton => BaseElevatedButton(
        child: child,
        style: materialStyle,
        onPressed: onPressed,
      );

  Widget get _textButton => TextButton(
        child: child,
        style: materialStyle,
        onPressed: onPressed,
      );
}
