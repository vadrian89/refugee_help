import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:refugee_help/presentation/core/app_theme.dart';
import 'package:refugee_help/presentation/core/screens/widgets_showcase_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: AppTheme.appTheme,
        darkTheme: AppTheme.appThemeDark,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: const WidgetsShowcaseScreen(),
      );
}
