import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FieldPlaceholderTile extends StatelessWidget {
  final IconData leadingIcon;
  final String label;
  final VoidCallback? onPressed;

  const FieldPlaceholderTile({
    Key? key,
    required this.leadingIcon,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        leading: CircleAvatar(child: Icon(leadingIcon)),
        title: Text(label),
        trailing: const Icon(MdiIcons.arrowRight),
        onTap: onPressed,
      );
}
