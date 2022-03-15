import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/dialogs/adaptive_dialog.dart';

import 'alt_icon_button.dart';

class DeleteIconButton extends StatelessWidget {
  final String deletedName;
  final VoidCallback onPressed;

  const DeleteIconButton({
    Key? key,
    required this.deletedName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(context) => AltIconButton(
        icon: MdiIcons.delete,
        onPressed: () => AdaptiveDialog.showConfirmation(
          context,
          title: "delete_something".tr(args: [deletedName]),
          content: "delete_confirmation.something".tr(args: [deletedName]),
          confirmText: "yes".tr(),
          cancelText: "no".tr(),
        ).then((value) => value ? onPressed() : null),
      );
}
