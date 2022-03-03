import 'dart:io';

import 'package:flutter/material.dart';

import 'adaptive_custom_dialog.dart';
import 'adaptive_dialog_action.dart';
import '../core/adaptive_widget.dart';

class AdaptiveMultiActionsDialog extends AdaptiveWidget {
  final String? title;
  final Widget? titleWidget;
  final String? content;
  final Widget? contentWidget;
  final List<AdaptiveDialogAction> actions;
  final EdgeInsetsGeometry? contentPadding;
  final bool scrollable;

  const AdaptiveMultiActionsDialog({
    Key? key,
    this.title,
    this.titleWidget,
    this.content,
    this.contentWidget,
    required this.actions,
    this.contentPadding,
    this.scrollable = false,
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
        actions: actions,
      );

  Future<bool?> show(BuildContext context) => showDialog<bool?>(
        context: context,
        builder: (context) => this,
        barrierDismissible: !Platform.isIOS,
      );

  Widget get _titleWidget => Text(title!);

  Widget get _contentWidget => Text(content!);
}
