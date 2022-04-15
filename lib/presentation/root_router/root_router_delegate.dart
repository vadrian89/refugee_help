import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/presentation/authentication/register/register_screen.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/dialogs/adaptive_dialog.dart';
import 'package:refugee_help/presentation/core/screens/main_screen.dart';
import 'package:refugee_help/presentation/housing/manage/manage_housing_screen.dart';
import 'package:refugee_help/presentation/tickets/manage/manage_ticket_screen.dart';
import 'package:refugee_help/presentation/transport/manage/manage_transport_screen.dart';
import 'package:refugee_help/presentation/user_profile/user_profile_screen.dart';

/// The root delegate of the app.
///
/// Used as value for [MaterialApp.router.routerDelegate].
/// This is the place where we set up what and how screens shown to the user.
///
/// Because I prefer to get rid of [addListener] and [removeListener] methods, I added [ChangeNotifier]
/// as mixin and call [notifyListeners] whenever [RootRouterCubit] emits a new state.
class RootRouterDelegate extends RouterDelegate<RootRouterState> with ChangeNotifier {
  final GlobalKey<NavigatorState> _navigatorKey;
  final RootRouterCubit _routerCubit;

  /// The value returned by the [Route] when [Navigator.onPopPage] is called.
  dynamic _popResult;

  RootRouterDelegate(GlobalKey<NavigatorState> navigatorKey, RootRouterCubit routerCubit)
      : _navigatorKey = navigatorKey,
        _routerCubit = routerCubit;

  /// The navigator's key.
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  /// Called by the [Router] when it detects a route information may have changed as a result of rebuild.
  ///
  /// This is required for browser history navigation.
  @override
  RootRouterState get currentConfiguration => _routerCubit.state;

  @override
  Widget build(BuildContext context) => BlocListener<RootRouterCubit, RootRouterState>(
        listener: (context, state) => notifyListeners(),
        child: Navigator(
          key: navigatorKey,
          pages: List.from([
            _materialPage(valueKey: "mainScreen", child: const MainScreen()),
            if (currentConfiguration.isRegister)
              _materialPage(valueKey: "registerScreen", child: const RegisterScreen()),
            ..._extraPages,
          ]),
          onPopPage: _onPopPageParser,
        ),
      );

  /// Set a new path based on the one reported by the system, by calling [RootRouterCubit.setNewRoutePath].
  ///
  /// This method is called by the [Router] when a new route has been requested by the underlying system.
  /// It’s recommended to return a [SynchronousFuture] to avoid waiting for microtasks.
  ///
  /// This happens right after the RouteInformation has been parsed by the [Router].
  /// For example: when a URL has been manually inserted, the URL get’s parsed, then this mehod is called.
  @override
  Future<void> setNewRoutePath(RootRouterState configuration) =>
      _routerCubit.setNewRoutePath(configuration);

  /// Parser for [Navigator.onPopPage] property, which calls [popRoute] to manage what happens when route was poped.
  /// If a pop ocurred `route.didPop(result) == true` then we pass the result value to the [_popResult] property
  /// to use when calling [RootRouterCubit.popRoute].
  bool _onPopPageParser(Route<dynamic> route, dynamic result) {
    if (!route.didPop(result)) return false;
    _popResult = result;
    popRoute();
    return true;
  }

  /// Called by the [Router] when the [Router.backButtonDispatcher] reports that
  /// the operating system is requesting that the current route be popped.
  ///
  /// We call [RootRouterCubit.popRoute] to go one level lower based on the logic implemented in the method.
  /// If [RootRouterCubit.popRoute] returns `false` it means we are the root of the app and should ask the user if
  /// he wants to close the app.
  ///
  /// The confirmation dialog should return `false` to confirm and `true` to cancel.
  @override
  Future<bool> popRoute() async {
    if (_routerCubit.popRoute(_popResult)) {
      if (currentConfiguration.isModalOpened) {
        await navigatorKey.currentState!.maybePop();
      }
      return Future.value(true);
    }
    if (navigatorKey.currentState?.canPop() ?? false) {
      navigatorKey.currentState!.maybePop();
      return Future.value(true);
    }
    return _confirmAppExit();
  }

  /// List of extra pages 1 level above stack.
  ///
  /// Alternatively to have a cleaner delegate, the list of pages can be built in a separate class.
  List<Page> get _extraPages {
    final tmpList = <Page>[];
    _routerCubit.state.maybeMap(
      orElse: () => null,
      register: (_) => null,
      home: (home) {
        if (home.viewProfile) {
          tmpList.add(
            _materialPage(valueKey: RootRouterState.profilePath, child: const UserProfileScreen()),
          );
        }
      },
      tickets: (tickets) {
        if ((tickets.id?.isNotEmpty ?? false) || tickets.add) {
          tmpList.add(
            _materialPage(
              valueKey: RootRouterState.ticketsPath,
              child: ManageTicketScreen(id: tickets.id, type: tickets.type!),
            ),
          );
        }
        if (tickets.transportId?.isNotEmpty ?? false) {
          tmpList.add(
            _materialPage(
              valueKey: RootRouterState.transportPath,
              child: ManageTransportScreen(id: tickets.transportId),
            ),
          );
        }
      },
      transport: (transport) {
        if ((transport.id?.isNotEmpty ?? false) || transport.add) {
          tmpList.add(
            _materialPage(
              valueKey: RootRouterState.transportPath,
              child: ManageTransportScreen(id: transport.id),
            ),
          );
        }
      },
      housing: (housing) {
        if ((housing.id?.isNotEmpty ?? false) || housing.add) {
          tmpList.add(
            _materialPage(
              valueKey: RootRouterState.transportPath,
              child: ManageHousingScreen(id: housing.id),
            ),
          );
        }
      },
    );

    return tmpList;
  }

  /// Ask the user to confirm he wants to exit the app.
  Future<bool> _confirmAppExit() async => !(await AdaptiveDialog.showConfirmation(
        _navigatorKey.currentContext!,
        title: "exit_app_title".tr(),
        content: "exit_app_confirm".tr(),
        cancelText: "cancel".tr(),
        confirmText: "close".tr(),
      ));

  /// Build a [Page] (screens) to use in [Navigator.pages] list.
  Page _materialPage({
    required String valueKey,
    required Widget child,
  }) =>
      MaterialPage(
        key: ValueKey<String>(valueKey),
        child: child,
      );
}
