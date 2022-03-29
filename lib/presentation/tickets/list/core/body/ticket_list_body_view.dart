import 'package:flutter/material.dart';
import 'package:refugee_help/domain/tickets/ticket_model.dart';
import 'package:refugee_help/presentation/core/responsive_widgets/responsive_widget.dart';

import 'ticket_list_tile.dart';
import 'ticket_list_body_table.dart';

class TicketListBodyView extends ResponsiveWidget {
  final List<TicketModel> list;

  const TicketListBodyView({Key? key, required this.list}) : super(key: key);

  @override
  Widget phone(BuildContext context) => ListView.separated(
        itemBuilder: (context, index) => TicketListTile(ticket: list[index]),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: list.length,
      );

  @override
  Widget desktop(BuildContext context) => TicketListBodyTable(list: list);
}
