import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:refugee_help/infrastructure/utils.dart';

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
      (Utils.isIos
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
        barrierDismissible: !Utils.isIos,
      );

  static Future<bool> showConfirmation(
    BuildContext context, {
    required String title,
    required String content,
    String? cancelText,
    required String confirmText,
  }) async =>
      (await AdaptiveDialog._(
        title: Text(title),
        content: Text(content),
        actions: [
          if (cancelText != null)
            AdaptiveDialogAction(
              child: Text(cancelText),
              onPressed: () => Navigator.maybePop(context, false),
            ),
          AdaptiveDialogAction(
            child: Text(confirmText),
            onPressed: () => Navigator.maybePop(context, true),
          ),
        ],
      ).show<bool>(context)) ??
      false;

  static Future<void> showNotification(
    BuildContext context, {
    required String title,
    required String content,
    String? buttonText,
  }) =>
      showConfirmation(
        context,
        title: title,
        content: content,
        confirmText: buttonText ?? "close".tr(),
      );

  static Future<void> showError(
    BuildContext context, {
    required String message,
  }) =>
      showNotification(
        context,
        title: "error".tr(),
        content: message,
      );
}
