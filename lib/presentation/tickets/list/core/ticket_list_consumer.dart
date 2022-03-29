import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/tickets/list/list_tickets_cubit.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/dialogs/adaptive_dialog.dart';
import 'package:refugee_help/presentation/core/utils/snackbars.dart';

class TicketListConsumer extends StatelessWidget {
  final ListTicketsCubit? bloc;
  final Widget Function(BuildContext context, ListTicketsState state) builder;

  const TicketListConsumer({Key? key, required this.builder, this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocConsumer<ListTicketsCubit, ListTicketsState>(
        bloc: bloc,
        listener: (context, state) => state.maybeWhen(
          orElse: () => null,
          deleting: () => showLoadingSnackBar(context, message: "ticket.deleting".tr()),
          success: (message) => showSuccessSnackBar(context, message: message),
          failure: (message) => AdaptiveDialog.showError(context, message: message),
          loading: (message) =>
              message.isNotEmpty ? showLoadingSnackBar(context, message: message) : null,
        ),
        listenWhen: (_, current) => current.maybeWhen(
          orElse: () => false,
          deleting: () => true,
          success: (_) => true,
          failure: (_) => true,
          loading: (message) => message.isNotEmpty,
        ),
        builder: builder,
        buildWhen: (_, current) => current.maybeWhen(orElse: () => false, view: (_) => true),
      );
}
