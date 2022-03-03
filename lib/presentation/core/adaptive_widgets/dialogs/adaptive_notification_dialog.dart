import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../core/adaptive_widget.dart';
import 'adaptive_confirmation_dialog.dart';

class ShNotificationDialog extends AdaptiveWidget {
  final String title;
  final String content;
  final String? confirmText;

  const ShNotificationDialog({
    Key? key,
    required this.title,
    required this.content,
    this.confirmText,
  }) : super(key: key);

  @override
  Widget cupertinoBuild(BuildContext context) => _dialog(context);

  @override
  Widget materialBuild(BuildContext context) => _dialog(context);

  AdaptiveConfirmationDialog _dialog(BuildContext context) => AdaptiveConfirmationDialog(
        title: title,
        content: content,
        confirmText: confirmText ?? "close".tr(),
      );

  Future<void> show(BuildContext context) => showDialog<void>(
        context: context,
        builder: (context) => this,
        barrierDismissible: !Platform.isIOS,
      );
}
