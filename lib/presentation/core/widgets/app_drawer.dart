import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';

import 'app_drawer/app_drawer_header.dart';
import 'app_drawer/drawer_list_tile.dart';
import 'app_drawer/volunteering_availability_tile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: Column(
          children: [
            const AppDrawerHeader(),
            DrawerListTile(
              icon: MdiIcons.account,
              label: "user_profile".tr(),
              onPressed: context.read<RootRouterCubit>().goToUserProfile,
            ),
            const VolunteeringAvailabilityTile(),
            const Spacer(),
            DrawerListTile(
              icon: MdiIcons.logout,
              label: "sign_out".tr(),
              onPressed: context.read<AuthenticationCubit>().signOut,
            ),
          ],
        ),
      );
}
