import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/application/user/user_cubit.dart';
import 'package:refugee_help/presentation/core/widgets/alt_app_bar.dart';
import 'package:refugee_help/presentation/user_profile/core/user_edit_button.dart';
import 'package:refugee_help/presentation/user_profile/core/user_profile_form.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => UserCubit(authCubit: context.read<AuthenticationCubit>()),
        child: ScaffoldMessenger(
          child: Scaffold(
            appBar: const AltAppBar(
              actions: [UserEditButton()],
            ).appBar,
            body: const UserProfileForm(),
          ),
        ),
      );
}
