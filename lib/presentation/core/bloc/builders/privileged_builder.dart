import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';

class PrivilegedBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, bool isPrivileged) builder;

  const PrivilegedBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) => builder(context, state.isPrivilegedUser),
        buildWhen: (_, current) => current.maybeWhen(
          orElse: () => false,
          authenticated: (_) => true,
        ),
      );
}
