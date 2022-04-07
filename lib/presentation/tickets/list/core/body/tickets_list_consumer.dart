import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/tickets/list/list_tickets_cubit.dart';
import 'package:refugee_help/domain/tickets/ticket_model.dart';
import 'package:refugee_help/presentation/core/widgets/loader_widget.dart';
import 'package:refugee_help/presentation/core/widgets/no_data_placeholder.dart';

class TicketsListConsumer extends StatelessWidget {
  final VoidCallback? onFinished;
  final Widget Function(BuildContext context, List<TicketModel> list) builder;

  const TicketsListConsumer({Key? key, required this.builder, this.onFinished}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocConsumer<ListTicketsCubit, ListTicketsState>(
        listener: (context, state) => state.maybeWhen(
          orElse: () => null,
          view: (_) => onFinished != null ? onFinished!() : null,
        ),
        listenWhen: (_, current) => current.maybeWhen(orElse: () => false, view: (_) => true),
        builder: (context, state) => state.maybeWhen(
          orElse: () => const LoaderWidget(),
          view: (list) => list.isEmpty ? const NoDataPlaceholder() : builder(context, list),
        ),
        buildWhen: (_, current) => current.maybeWhen(orElse: () => false, view: (_) => true),
      );
}
