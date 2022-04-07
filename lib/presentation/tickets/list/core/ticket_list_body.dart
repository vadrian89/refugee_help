import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/application/tickets/list/list_tickets_cubit.dart';
import 'package:refugee_help/domain/tickets/ticket_type_model.dart';
import 'package:refugee_help/presentation/tickets/list/core/body/ticket_list_body_view.dart';

import 'ticket_list_listener.dart';

class TicketListBody extends StatelessWidget {
  final TicketTypeModel type;

  const TicketListBody({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(_) => BlocProvider(
        create: (context) => ListTicketsCubit(
          type: type,
          authCubit: context.read<AuthenticationCubit>(),
        ),
        child: const TicketListListener(child: TicketListBodyView()),
      );
}
