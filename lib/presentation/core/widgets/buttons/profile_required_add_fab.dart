import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/presentation/core/utils/snackbars.dart';

class ProfileRequiredAddFab extends StatelessWidget {
  final VoidCallback? onPressed;

  const ProfileRequiredAddFab({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) => FloatingActionButton(
          child: const Icon(MdiIcons.plus),
          onPressed: () => state.maybeWhen(
              orElse: () => null,
              authenticated: (user) => user.isValid
                  ? onPressed!()
                  : showErrorSnackBar(context, message: "please_complete_profile".tr())),
        ),
      );
}
