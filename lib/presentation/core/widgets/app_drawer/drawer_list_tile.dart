import 'package:flutter/material.dart';
import 'package:refugee_help/presentation/core/responsive_widgets/responsive_widget.dart';

class DrawerListTile extends ResponsiveWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool isSelected;

  const DrawerListTile({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget phone(BuildContext context) => ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(label),
        onTap: onPressed,
      );

  @override
  Widget desktop(BuildContext context) => ListTile(
        leading: Icon(icon),
        iconColor: isSelected ? Theme.of(context).primaryColor : null,
        title: Text(label),
        textColor: isSelected ? Theme.of(context).primaryColor : null,
        onTap: onPressed,
      );
}
