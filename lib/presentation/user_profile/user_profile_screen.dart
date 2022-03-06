import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/application/user/user_cubit.dart';
import 'package:refugee_help/presentation/user_profile/core/user_edit_button.dart';
import 'package:refugee_help/presentation/user_profile/core/user_profile_form.dart';

import 'core/user_profile_listener.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => UserCubit(authCubit: context.read<AuthenticationCubit>()),
        child: ScaffoldMessenger(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              actions: const [UserEditButton()],
            ),
            body: const UserProfileListener(child: UserProfileForm()),
          ),
        ),
      );
}
