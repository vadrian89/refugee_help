import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/application/transport/list/list_transport_cubit.dart';
import 'package:refugee_help/presentation/core/widgets/app_drawer.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/profile_required_add_fab.dart';
import 'package:refugee_help/presentation/core/widgets/core_bottom_navigation.dart';
import 'package:refugee_help/presentation/transport/list/core/transport_list_body.dart';

class TransportListScreen extends StatelessWidget {
  const TransportListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => ListTransportCubit(
          authCubit: context.read<AuthenticationCubit>(),
        )..fetchList(),
        child: ScaffoldMessenger(
          child: Scaffold(
            appBar: AppBar(title: const Text("Transport")),
            drawer: const AppDrawer(),
            body: const TransportListBody(),
            floatingActionButton: ProfileRequiredAddFab(
              onPressed: () => context.read<RootRouterCubit>().goToTransport(add: true),
            ),
            bottomNavigationBar: const CoreBottomNavigation(),
          ),
        ),
      );
}
