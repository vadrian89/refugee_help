import 'dart:io';

import 'package:flutter/material.dart';

import 'adaptive_custom_dialog.dart';
import 'adaptive_dialog_action.dart';
import '../core/adaptive_widget.dart';

class AdaptiveConfirmationDialog extends AdaptiveWidget {
  final String? title;
  final Widget? titleWidget;
  final String? content;
  final Widget? contentWidget;
  final String? cancelText;
  final String confirmText;
  final EdgeInsetsGeometry? contentPadding;
  final bool scrollable;
  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;

  const AdaptiveConfirmationDialog({
    Key? key,
    this.title,
    this.titleWidget,
    this.content,
    this.contentWidget,
    this.cancelText,
    required this.confirmText,
    this.contentPadding,
    this.scrollable = false,
    this.onCancel,
    this.onConfirm,
  })  : assert(title == null || titleWidget == null),
        assert(content == null || contentWidget == null),
        super(key: key);

  @override
  Widget cupertinoBuild(BuildContext context) => _dialog(context);

  @override
  Widget materialBuild(BuildContext context) => _dialog(context);

  AdaptiveCustomDialog _dialog(BuildContext context) => AdaptiveCustomDialog(
        title: titleWidget ?? _titleWidget,
        content: contentWidget ?? _contentWidget,
        contentPadding: contentPadding,
        scrollable: scrollable,
        actions: _actions(context),
      );

  Future<bool> show(BuildContext context) => showDialog<bool>(
        context: context,
        builder: (context) => this,
        barrierDismissible: !Platform.isIOS,
      ).then((result) => result ?? false);

  Widget get _titleWidget => Text(title!);

  Widget get _contentWidget => Text(content!);

  List<AdaptiveDialogAction> _actions(BuildContext context) => [
        if (cancelText != null)
          AdaptiveDialogAction(
            child: Text(cancelText!),
            onPressed: () => (onCancel != null) ? onCancel!() : Navigator.pop(context, false),
          ),
        AdaptiveDialogAction(
          child: Text(confirmText),
          onPressed: () => (onConfirm != null) ? onConfirm!() : Navigator.pop(context, true),
        ),
      ];
}
