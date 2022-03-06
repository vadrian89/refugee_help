import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/base_elevated_buton.dart';

class SaveButton extends StatelessWidget {
  final VoidCallback onSave;

  const SaveButton({
    Key? key,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseElevatedButton.icon(
        label: Text("save".tr()),
        icon: const Icon(MdiIcons.contentSaveOutline),
        onPressed: onSave,
      );
}
