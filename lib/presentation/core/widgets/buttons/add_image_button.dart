import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'base_elevated_buton.dart';

class AddImageButton extends StatelessWidget {
  final VoidCallback onAdd;

  const AddImageButton({Key? key, required this.onAdd}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseElevatedButton.icon(
        icon: const Icon(MdiIcons.cameraPlus),
        label: Text("add_image".tr()),
        onPressed: onAdd,
      );
}
