import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/presentation/core/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/presentation/root_router/root_router_delegate.dart';
import 'package:refugee_help/presentation/root_router/root_router_parser.dart';

class AppRoot extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        theme: AppTheme.appTheme,
        darkTheme: AppTheme.appThemeDark,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routeInformationParser: const RootRouterParser(),
        routerDelegate: RootRouterDelegate(
          _navigatorKey,
          context.read<RootRouterCubit>(),
        ),
      );
}
