import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/application/tickets/manage/manage_ticket_cubit.dart';
import 'package:refugee_help/domain/tickets/ticket_model.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/dialogs/adaptive_dialog.dart';
import 'package:refugee_help/presentation/core/utils/snackbars.dart';
import 'package:refugee_help/presentation/core/widgets/loader_widget.dart';

class ManageTicketConsumer extends StatelessWidget {
  final Widget Function(BuildContext context, TicketModel? ticket, bool editable) builder;

  const ManageTicketConsumer({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocConsumer<ManageTicketCubit, ManageTicketState>(
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
          unkown: context.read<RootRouterCubit>().goToRoot,
        ),
        listenWhen: (_, current) => current.maybeMap(
          orElse: () => false,
          loading: (_) => true,
          success: (_) => true,
          failure: (_) => true,
          unkown: (_) => true,
        ),
        builder: (context, state) => state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          initial: () => const LoaderWidget(),
          view: (ticket) => builder(context, ticket, false),
          edit: (_) => builder(context, null, true),
        ),
        buildWhen: (_, current) => current.maybeMap(
          orElse: () => false,
          view: (_) => true,
          edit: (_) => true,
        ),
      );
}
