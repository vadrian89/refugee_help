import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/domain/dev/dev_repository.dart';
import 'package:refugee_help/presentation/core/responsive_widgets/responsive_widget.dart';
import 'package:refugee_help/presentation/core/widgets/text/head6_text.dart';

import 'app_drawer/app_drawer_header.dart';
import 'app_drawer/drawer_list_tile.dart';
import 'app_drawer/volunteering_availability_tile.dart';

class AppDrawer extends ResponsiveWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget phone(BuildContext context) => Drawer(
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

  @override
  Widget desktop(BuildContext context) => BlocBuilder<RootRouterCubit, RootRouterState>(
        builder: (context, state) => Drawer(
          child: Column(
            children: [
              const AppDrawerHeader(),
              DrawerListTile(
                icon: MdiIcons.account,
                label: "user_profile".tr(),
                isSelected: state.maybeMap(orElse: () => false, home: (home) => home.viewProfile),
                onPressed: context.read<RootRouterCubit>().goToUserProfile,
              ),
              DrawerListTile(
                icon: MdiIcons.ticket,
                label: "home".tr(),
                isSelected: state.maybeMap(orElse: () => false, home: (_) => true),
                onPressed: context.read<RootRouterCubit>().goToRoot,
              ),
              DrawerListTile(
                icon: MdiIcons.car,
                label: "Transport",
                isSelected: state.maybeMap(orElse: () => false, transport: (_) => true),
                onPressed: context.read<RootRouterCubit>().goToTransport,
              ),
              const VolunteeringAvailabilityTile(),
              const Spacer(),
              if (kDebugMode) ..._devTiles,
              DrawerListTile(
                icon: MdiIcons.logout,
                label: "sign_out".tr(),
                onPressed: context.read<AuthenticationCubit>().signOut,
              ),
            ],
          ),
        ),
      );

  List<Widget> get _devTiles => [
        const Head6Text(text: "Dev options"),
        DrawerListTile(
          icon: MdiIcons.car2Plus,
          label: "Multiply transport",
          onPressed: () async {
            final repo = DevRepository();
            await repo.multiplyTransport();
            repo.close();
          },
        ),
        DrawerListTile(
          icon: MdiIcons.delete,
          label: "Clear transport",
          onPressed: () async {
            final repo = DevRepository();
            await repo.clearTransport();
            repo.close();
          },
        ),
        DrawerListTile(
          icon: MdiIcons.ticketConfirmation,
          label: "Multiply tickets",
          onPressed: () async {
            final repo = DevRepository();
            await repo.multiplyTickets();
            repo.close();
          },
        ),
        DrawerListTile(
          icon: MdiIcons.delete,
          label: "Clear tickets",
          onPressed: () async {
            final repo = DevRepository();
            await repo.clearTickets();
            repo.close();
          },
        ),
        const Spacer(),
      ];
}
