import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/domain/tickets/ticket_model.dart';
import 'package:refugee_help/presentation/core/widgets/text/head6_text.dart';
import 'package:refugee_help/presentation/core/widgets/text/sub2_text.dart';
import 'package:refugee_help/presentation/tickets/list/core/ticket_status_avatar.dart';

class TicketListTile extends StatelessWidget {
  final TicketModel ticket;

  const TicketListTile({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        leading: TicketStatusAvatar(ticket: ticket),
        title: Head6Text(text: "${"destination".tr()}: ${ticket.destination!}"),
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.5),
              child: Sub2Text(
                text: "Transport: ${ticket.transport!.registrationNumber}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.5),
              child: Sub2Text(
                text: "${"status".tr()} ${ticket.status.name}",
              ),
            ),
          ],
        ),
        onTap: () => context.read<RootRouterCubit>().goToTickets(
              id: ticket.id,
              type: ticket.type,
            ),
      );
}
