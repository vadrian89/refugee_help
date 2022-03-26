import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';

class CoreBottomNavigation extends StatelessWidget {
  const CoreBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<RootRouterCubit, RootRouterState>(
        builder: (context, state) => BottomNavigationBar(
          currentIndex: state.maybeMap(
            orElse: () => 0,
            transport: (_) => 1,
          ),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(MdiIcons.ticket),
              label: "home".tr(),
            ),
            const BottomNavigationBarItem(
              icon: Icon(MdiIcons.car),
              label: "Transport",
            ),
            BottomNavigationBarItem(
              icon: const Icon(MdiIcons.homeGroup),
              label: "housing".tr(),
            )
          ],
          onTap: (index) => _onTap(context, index),
        ),
      );

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 1:
        context.read<RootRouterCubit>().goToTransport();
        break;
      case 2:
        break;
      default:
        context.read<RootRouterCubit>().goToRoot();
    }
  }
}
