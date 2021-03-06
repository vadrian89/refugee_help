import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/application/root_router/router_transport_state.dart';
import 'package:refugee_help/presentation/core/widgets/app_scaffold.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/profile_required_add_fab.dart';
import 'package:refugee_help/presentation/transport/list/core/transport_list_body.dart';

class TransportListScreen extends StatelessWidget {
  const TransportListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScaffoldMessenger(
        child: AppScaffold(
          appBar: AppBar(title: const Text("Transport")),
          body: const TransportListBody(),
          addButton: ProfileRequiredAddFab(
            onPressed: () => context.read<RootRouterCubit>().goToTransport(
                  RouterTransportState.add(),
                ),
          ),
        ),
      );
}
