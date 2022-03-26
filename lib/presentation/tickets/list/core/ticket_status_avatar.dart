import 'package:flutter/material.dart';
import 'package:refugee_help/domain/tickets/ticket_model.dart';

class TicketStatusAvatar extends StatelessWidget {
  final TicketModel ticket;

  const TicketStatusAvatar({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) => CircleAvatar(
        child: Icon(ticket.status.icon),
        foregroundColor: Colors.white,
        backgroundColor: ticket.status.color,
      );
}
