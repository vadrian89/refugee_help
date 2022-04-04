import 'package:flutter/material.dart';

class TicketCategoryListTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  const TicketCategoryListTile({
    Key? key,
    required this.label,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListTile(
          tileColor: (onPressed != null) ? Theme.of(context).primaryColor : Colors.grey,
          iconColor: Theme.of(context).colorScheme.onPrimary,
          textColor: Theme.of(context).colorScheme.onPrimary,
          leading: Icon(icon),
          title: Text(label),
          onTap: onPressed,
        ),
      );
}
