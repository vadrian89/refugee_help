import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/domain/tickets/ticket_type_model.dart';
import 'package:refugee_help/presentation/core/bloc_builders/privileged_builder.dart';
import 'package:refugee_help/presentation/core/widgets/app_scaffold.dart';
import 'package:refugee_help/presentation/tickets/list/core/ticket_list_body.dart';

class TicketsListScreen extends StatelessWidget {
  final TicketTypeModel type;

  const TicketsListScreen({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScaffoldMessenger(
        child: AppScaffold(
          appBar: AppBar(
            leading: BackButton(onPressed: context.read<RootRouterCubit>().goToRoot),
            title: Text(type.translatedName),
          ),
          body: TicketListBody(type: type),
          addButton: PrivilegedBuilder(
            builder: (context, isPrivileged) => Visibility(
              visible: isPrivileged,
              child: FloatingActionButton(
                child: const Icon(MdiIcons.plus),
                onPressed: () => context.read<RootRouterCubit>().goToTickets(
                      type: type,
                      add: true,
                    ),
              ),
            ),
          ),
        ),
      );
}
