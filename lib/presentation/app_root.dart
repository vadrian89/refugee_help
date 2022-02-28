import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:refugee_help/presentation/core/screens/app_theme.dart';

import 'core/screens/main_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: AppTheme.appTheme,
        darkTheme: AppTheme.appThemeDark,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: const MainScreen(),
      );
}
