import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/presentation/authentication/authentication_screen.dart';
import 'package:refugee_help/presentation/core/screens/loading_screen.dart';
import 'package:refugee_help/presentation/core/screens/unkown_screen.dart';
import 'package:refugee_help/presentation/home/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<RootRouterCubit, RootRouterState>(
        builder: (context, state) => state.maybeWhen(
          initial: () => const LoadingScreen(),
          orElse: () => const UnkownScreen(),
          unauthenticated: () => const AuthenticationScreen(),
          home: (_) => const HomeScreen(),
        ),
      );
}
