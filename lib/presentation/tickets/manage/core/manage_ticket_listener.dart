import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/tickets/manage/manage_ticket_cubit.dart';
import 'package:refugee_help/domain/tickets/ticket_model.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/dialogs/adaptive_dialog.dart';
import 'package:refugee_help/presentation/core/utils/snackbars.dart';

class ManageTicketListener extends StatelessWidget {
  final Widget child;
  final void Function(TicketModel ticket) onView;
  final void Function(TicketModel ticket) onEdit;

  const ManageTicketListener({
    Key? key,
    required this.child,
    required this.onView,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocListener<ManageTicketCubit, ManageTicketState>(
        listener: (context, state) => state.maybeWhen(
          orElse: () => null,
          loading: (message) => showLoadingSnackBar(context, message: message),
          success: (message, popScreen) => (message != null && !popScreen)
              ? showSuccessSnackBar(context, message: message)
              : Navigator.maybePop(context),
          failure: (message) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            return AdaptiveDialog.showError(context, message: message);
          },
          view: (ticket) => onView(ticket),
          edit: onEdit,
        ),
        child: child,
      );
}
