import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'alt_icon_button.dart';

class EditIconButton extends StatelessWidget {
  final VoidCallback onPressed;

  const EditIconButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) => AltIconButton(
        icon: MdiIcons.pencil,
        onPressed: onPressed,
      );
}
