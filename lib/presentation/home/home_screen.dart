import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/presentation/core/bloc_builders/privileged_builder.dart';
import 'package:refugee_help/presentation/tickets/list/core/ticket_list_body.dart';

import '../core/widgets/app_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(_) => ScaffoldMessenger(
        child: AppScaffold(
          appBar: AppBar(title: Text("home".tr())),
          body: const TicketListBody(),
          addButton: PrivilegedBuilder(
            builder: (context, isPrivileged) => Visibility(
              visible: isPrivileged,
              child: FloatingActionButton(
                child: const Icon(MdiIcons.plus),
                onPressed: () => context.read<RootRouterCubit>().goToTickets(add: true),
              ),
            ),
          ),
        ),
      );
}
