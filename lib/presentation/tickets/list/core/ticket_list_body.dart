import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/application/tickets/list/list_tickets_cubit.dart';
import 'package:refugee_help/presentation/core/utils/widgets_utils.dart';
import 'package:refugee_help/presentation/core/widgets/loader_widget.dart';
import 'package:refugee_help/presentation/core/widgets/no_data_placeholder.dart';
import 'package:refugee_help/presentation/tickets/list/core/body/ticket_list_body_view.dart';

import 'ticket_list_consumer.dart';

class TicketListBody extends StatelessWidget {
  const TicketListBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDesktop = WidgetUtils.isDesktop(context);
    return BlocProvider(
      create: (context) => ListTicketsCubit(
        authCubit: context.read<AuthenticationCubit>(),
      )..fetchList(isTable: isDesktop),
      child: TicketListConsumer(
        builder: (context, state) => state.maybeMap(
          orElse: () => const LoaderWidget(),
          view: (view) {
            if (view.list.isEmpty) {
              return const NoDataPlaceholder();
            }
            return TicketListBodyView(list: view.list);
          },
        ),
      ),
    );
  }
}
