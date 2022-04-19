import 'package:flutter/material.dart';

class HousingInfoSheetTile extends StatelessWidget {
  final String label;
  final IconData? icon;

  const HousingInfoSheetTile({
    Key? key,
    required this.label,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        leading: (icon != null) ? CircleAvatar(child: Icon(icon)) : null,
        title: Text(label),
      );
}
