import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/presentation/authentication/authentication_screen.dart';
import 'package:refugee_help/presentation/core/screens/loading_screen.dart';
import 'package:refugee_help/presentation/core/screens/unkown_screen.dart';
import 'package:refugee_help/presentation/home/home_screen.dart';
import 'package:refugee_help/presentation/housing/list/housing_list_screen.dart';
import 'package:refugee_help/presentation/tickets/list/tickets_list_screen.dart';
import 'package:refugee_help/presentation/transport/list/transport_list_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<RootRouterCubit, RootRouterState>(
        builder: (context, state) => state.maybeWhen(
          initial: () => const LoadingScreen(),
          orElse: () => const UnkownScreen(),
          unauthenticated: () => const AuthenticationScreen(),
          register: () => const AuthenticationScreen(),
          home: (_, __) => const HomeScreen(),
          tickets: (stateConfig) => (stateConfig.type == null)
              ? const HomeScreen()
              : TicketsListScreen(type: stateConfig.type!),
          transport: (_) => const TransportListScreen(),
          housing: (_) => const HousingListScreen(),
        ),
      );
}
