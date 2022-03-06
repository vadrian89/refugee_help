import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/presentation/core/widgets/circle_image_avatar.dart';

class AppDrawerHeader extends StatelessWidget {
  const AppDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) => DrawerHeader(
          child: Center(
            child: CircleImageAvatar(
              backgroundColor: Colors.white,
              foregroundColor: Theme.of(context).primaryColor,
              image: state.maybeWhen(
                orElse: () => null,
                authenticated: (user) => user.profileImage,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
        ),
      );
}
