import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'adaptive_dialog_action.dart';
import '../core/adaptive_widget.dart';

class AdaptiveCustomDialog extends AdaptiveWidget {
  final Widget title;
  final Widget content;
  final List<AdaptiveDialogAction> actions;
  final bool scrollable;
  final EdgeInsetsGeometry? contentPadding;

  EdgeInsetsGeometry get _contentPadding =>
      contentPadding ??
      (Platform.isIOS
          ? const EdgeInsets.symmetric(vertical: 20)
          : const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0));

  const AdaptiveCustomDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.actions,
    this.scrollable = false,
    this.contentPadding,
  }) : super(key: key);

  @override
  Widget cupertinoBuild(BuildContext context) => CupertinoAlertDialog(
        title: title,
        content: Padding(
          padding: _contentPadding,
          child: content,
        ),
        actions: actions,
      );

  @override
  Widget materialBuild(BuildContext context) => AlertDialog(
        title: title,
        content: content,
        contentPadding: _contentPadding,
        actions: actions,
        clipBehavior: Clip.antiAlias,
        scrollable: scrollable,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      );

  Future<bool?> show(BuildContext context) => showDialog<bool?>(
        context: context,
        builder: (context) => this,
        barrierDismissible: !Platform.isIOS,
      );
}
