import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:refugee_help/presentation/home/core/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("refugee_help".tr())),
        drawer: const AppDrawer(),
        // body: UserProfileForm(),
        // bottomNavigationBar: const HomeBottomNavigation(),
      );
}
