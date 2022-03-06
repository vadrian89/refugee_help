import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeBottomNavigation extends StatelessWidget {
  const HomeBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(MdiIcons.home),
            label: "home".tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(MdiIcons.account),
            label: "profile".tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(MdiIcons.handHeart),
            label: "your_offerings".tr(),
          )
        ],
      );
}
