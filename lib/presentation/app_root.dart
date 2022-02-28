import 'package:flutter/material.dart';
import 'package:refugee_help/infrastructure/theme_util.dart';

import 'core/screens/main_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeUtil.appTheme,
        home: const MainScreen(),
      );
}
