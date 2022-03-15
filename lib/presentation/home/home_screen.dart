import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:refugee_help/presentation/core/widgets/app_drawer.dart';
import 'package:refugee_help/presentation/core/widgets/no_data_placeholder.dart';

import '../core/widgets/core_bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScaffoldMessenger(
        child: Scaffold(
          appBar: AppBar(title: Text("refugee_help".tr())),
          drawer: const AppDrawer(),
          body: const NoDataPlaceholder(),
          bottomNavigationBar: const CoreBottomNavigation(),
        ),
      );
}
