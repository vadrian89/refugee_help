import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/base_elevated_buton.dart';

class CancelButton extends StatelessWidget {
  final VoidCallback onCancel;

  const CancelButton({Key? key, required this.onCancel}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseElevatedButton.icon(
        icon: const Icon(MdiIcons.cancel),
        label: Text("cancel".tr()),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Theme.of(context).brightness == Brightness.dark ? Colors.red[200] : Colors.red,
          ),
        ),
        onPressed: onCancel,
      );
}
