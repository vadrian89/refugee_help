import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/application/tickets/list/list_tickets_cubit.dart';
import 'package:refugee_help/presentation/core/widgets/loader_widget.dart';
import 'package:refugee_help/presentation/core/widgets/no_data_placeholder.dart';
import 'package:refugee_help/presentation/tickets/list/core/ticket_list_tile.dart';

import 'ticket_list_consumer.dart';

class TicketListBody extends StatelessWidget {
  const TicketListBody({Key? key}) : super(key: key);

  @override
  Widget build(_) => BlocProvider(
        create: (context) => ListTicketsCubit(
          authCubit: context.read<AuthenticationCubit>(),
        )..fetchList(),
        child: TicketListConsumer(
          builder: (context, state) => state.maybeWhen(
            orElse: () => const LoaderWidget(),
            view: (list) {
              if (list.isEmpty) {
                return const NoDataPlaceholder();
              }
              return ListView.separated(
                itemBuilder: (context, index) => TicketListTile(ticket: list[index]),
                separatorBuilder: (_, __) => const Divider(),
                itemCount: list.length,
              );
            },
          ),
        ),
      );
}
