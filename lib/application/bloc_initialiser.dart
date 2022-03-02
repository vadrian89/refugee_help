import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/domain/authentication/authentication_repository.dart';
import 'package:refugee_help/presentation/app_root.dart';

/// Used to initialise bloc-related stuff, such as: blocs, cubits and repositories.
class BlocInitialiser extends StatelessWidget {
  final AppRoot appRoot;

  const BlocInitialiser({Key? key, required this.appRoot}) : super(key: key);

  @override
  Widget build(_) => _initProviders(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthenticationCubit(
                repo: context.read<AuthenticationRepository>(),
              ),
            ),
            BlocProvider(
              create: (context) => RootRouterCubit(
                authCubit: context.read<AuthenticationCubit>(),
              ),
            ),
          ],
          child: Builder(builder: (_) => appRoot),
        ),
      );

  Widget _initProviders({required Widget child}) => MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => AuthenticationRepository(),
          ),
        ],
        child: child,
      );
}
