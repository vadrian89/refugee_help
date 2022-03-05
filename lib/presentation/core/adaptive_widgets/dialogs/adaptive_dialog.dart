import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'adaptive_dialog_action.dart';
import '../core/adaptive_widget.dart';

class AdaptiveDialog extends AdaptiveWidget {
  const AdaptiveDialog._({
    Key? key,
    required this.title,
    required this.content,
    required this.actions,
    this.scrollable = false,
    this.contentPadding,
  }) : super(key: key);

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

  Future<T?> show<T extends Object?>(BuildContext context) => showDialog(
        context: context,
        builder: (context) => this,
        barrierDismissible: !Platform.isIOS,
      );

  static Future<bool?> showConfirmation(
    BuildContext context, {
    required String title,
    required String content,
    required String cancelText,
    required String confirmText,
  }) =>
      AdaptiveDialog._(
        title: Text(title),
        content: Text(content),
        actions: [
          AdaptiveDialogAction(
            child: Text(cancelText),
            onPressed: () => Navigator.maybePop(context, false),
          ),
          AdaptiveDialogAction(
            child: Text(confirmText),
            onPressed: () => Navigator.maybePop(context, true),
          ),
        ],
      ).show<bool>(context);

  static Future<bool?> showNotification(
    BuildContext context, {
    required String title,
    required String content,
    String? confirmText,
  }) =>
      AdaptiveDialog._(
        title: Text(title),
        content: Text(content),
        actions: [
          AdaptiveDialogAction(
            child: Text(confirmText ?? "Ok"),
            onPressed: () => Navigator.maybePop(context),
          ),
        ],
      ).show<bool>(context);

  static Future<bool?> showError(
    BuildContext context, {
    required String message,
  }) =>
      AdaptiveDialog._(
        title: const Text("Error"),
        content: Text(message),
        actions: [
          AdaptiveDialogAction(
            child: const Text("Ok"),
            onPressed: () => Navigator.maybePop(context),
          ),
        ],
      ).show<bool>(context);
}
