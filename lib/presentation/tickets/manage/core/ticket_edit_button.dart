import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/tickets/manage/manage_ticket_cubit.dart';
import 'package:refugee_help/presentation/core/bloc_builders/privileged_builder.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/edit_icon_button.dart';

class TicketEditButton extends StatelessWidget {
  const TicketEditButton({Key? key}) : super(key: key);

  @override
  Widget build(_) => PrivilegedBuilder(
        builder: (context, isPrivileged) => Visibility(
          visible: isPrivileged,
          child: EditIconButton(onPressed: context.read<ManageTicketCubit>().toggleEdit),
        ),
      );
}
