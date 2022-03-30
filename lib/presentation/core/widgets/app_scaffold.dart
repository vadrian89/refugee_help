import 'package:flutter/material.dart';
import 'package:refugee_help/presentation/core/responsive_widgets/responsive_widget.dart';
import 'package:refugee_help/presentation/core/widgets/app_drawer.dart';
import 'package:refugee_help/presentation/core/widgets/core_bottom_navigation.dart';

class AppScaffold extends ResponsiveWidget {
  final Widget? addButton;
  final Widget? body;
  final PreferredSizeWidget? appBar;

  const AppScaffold({
    Key? key,
    this.appBar,
    this.addButton,
    this.body,
  }) : super(key: key);

  @override
  Widget phone(BuildContext context) => Scaffold(
        appBar: appBar,
        drawer: const AppDrawer(),
        body: body,
        floatingActionButton: addButton,
        bottomNavigationBar: const CoreBottomNavigation(),
      );

  @override
  Widget desktop(BuildContext context) => Row(
        children: [
          const AppDrawer(),
          Expanded(
            child: Scaffold(
              body: body,
              floatingActionButton: addButton,
            ),
          ),
        ],
      );
}
