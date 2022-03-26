import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/application/tickets/manage/manage_ticket_cubit.dart';
import 'package:refugee_help/presentation/core/widgets/alt_app_bar.dart';

import 'core/manage_ticket_form.dart';
import 'core/ticket_edit_button.dart';

class ManageTicketScreen extends StatelessWidget {
  final String? id;

  const ManageTicketScreen({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => ManageTicketCubit(
          authCubit: context.read<AuthenticationCubit>(),
          id: id,
        ),
        child: ScaffoldMessenger(
          child: Scaffold(
            appBar: const AltAppBar(
              actions: [TicketEditButton()],
            ).appBar,
            body: const ManageTicketForm(),
          ),
        ),
      );
}
