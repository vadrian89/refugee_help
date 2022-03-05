import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/authentication/register/register_cubit.dart';
import 'package:refugee_help/domain/authentication/authentication_repository.dart';
import 'package:refugee_help/presentation/authentication/register/register_form.dart';
import 'package:refugee_help/presentation/authentication/register/register_listener.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => RegisterCubit(authRepo: context.read<AuthenticationRepository>()),
        child: ScaffoldMessenger(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
            ),
            body: const RegisterListener(child: RegisterForm()),
          ),
        ),
      );
}
