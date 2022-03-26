import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/tickets/manage/manage_ticket_cubit.dart';
import 'package:refugee_help/presentation/authentication/core/buttons/cancel_button.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/save_button.dart';

class TicketButtonBar extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onSave;

  const TicketButtonBar({
    Key? key,
    required this.onSave,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<ManageTicketCubit, ManageTicketState>(
        builder: (context, state) => Visibility(
          visible: state.maybeMap(orElse: () => false, edit: (_) => true),
          child: ButtonBar(
            children: [
              CancelButton(onCancel: onCancel),
              SaveButton(onSave: onSave),
            ],
          ),
        ),
        buildWhen: (_, current) => current.maybeMap(
          orElse: () => false,
          view: (_) => true,
          edit: (_) => true,
        ),
      );
}
