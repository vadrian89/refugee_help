import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/application/user/user_cubit.dart';
import 'package:refugee_help/presentation/core/utils/snackbars.dart';

/// Tile to activate/deactivate push notifications for the user.
class VolunteeringAvailabilityTile extends StatelessWidget {
  const VolunteeringAvailabilityTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => UserCubit(authCubit: context.read<AuthenticationCubit>()),
        child: BlocListener<UserCubit, UserState>(
          listener: (context, state) => state.maybeWhen(
            orElse: () => null,
            success: (message) => _showSuccess(context, message: message),
            failure: (message) => showErrorSnackBar(
              context,
              message: message,
              behavior: SnackBarBehavior.floating,
            ),
          ),
          listenWhen: (_, current) => current.maybeWhen(
            orElse: () => false,
            success: (_) => true,
            failure: (_) => true,
          ),
          child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
            builder: (context, state) => state.maybeWhen(
              orElse: () => const SizedBox(),
              authenticated: (user) => SwitchListTile.adaptive(
                title: Text("volunteering_availability".tr()),
                value: user.available ?? false,
                onChanged: (val) =>
                    context.read<UserCubit>().toggleAvailability(user.copyWith(available: val)),
              ),
            ),
            buildWhen: (_, current) => current.maybeWhen(
              orElse: () => false,
              authenticated: (_) => true,
            ),
          ),
        ),
      );

  void _showSuccess(BuildContext context, {String? message}) {
    if (message == null) return;

    showSuccessSnackBar(context, message: message, behavior: SnackBarBehavior.floating);
  }
}
