import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/application/root_router/router_transport_state.dart';
import 'package:refugee_help/domain/tickets/ticket_type_model.dart';
import 'package:refugee_help/domain/user/user_model.dart';
import 'package:refugee_help/infrastructure/utils.dart';

import 'router_housing_state.dart';
import 'router_tickets_state.dart';

part 'root_router_state.dart';
part 'root_router_cubit.freezed.dart';

/// Cubit which contains the root router's logic.
class RootRouterCubit extends Cubit<RootRouterState> {
  /// The stream subcription required to be notified when [AuthenticationState] is changed.
  ///
  /// You can read about streams here: https://dart.dev/tutorials/language/streams
  /// And about stream subscriptions: https://api.dart.dev/stable/2.15.1/dart-async/StreamSubscription-class.html
  late final StreamSubscription<AuthenticationState> _authStateSub;
  final AuthenticationCubit _authCubit;

  RootRouterCubit({required AuthenticationCubit authCubit})
      : _authCubit = authCubit,
        super(const RootRouterState.initial()) {
    _authStateSub = _authCubit.stream.listen(_stateFromAuthState);
  }

  /// Go to the root of the app, depending on the current [AuthenticationState].
  ///
  /// Recommended to be used whenever you want to go the root of the app.
  bool goToRoot() {
    emit(_authCubit.state.maybeWhen(
      orElse: () => const RootRouterState.unauthenticated(),
      authenticated: (user) => RootRouterState.home(user: user),
    ));
    return true;
  }

  /// Public method used to show [RegisterInScreen].
  void goToRegister() => _onlyUnauthenticated(const RootRouterState.register());

  void goToUserProfile() => _onlyAuthenticated(const RootRouterState.home(viewProfile: true));

  void goToTransport([RouterTransportState transport = const RouterTransportState()]) =>
      _onlyAuthenticated(state.maybeWhen(
        orElse: () => transport.state,
        tickets: (stateConfig) => (stateConfig.add || (stateConfig.id?.isNotEmpty ?? false))
            ? stateConfig.copyWith(transportId: transport.id).state
            : transport.state,
      ));

  void goToHousing([RouterHousingState housing = const RouterHousingState()]) =>
      _onlyAuthenticated(state.maybeWhen(
        orElse: () => housing.state,
        tickets: (stateConfig) => (stateConfig.add || (stateConfig.id?.isNotEmpty ?? false))
            ? stateConfig.copyWith(housingId: housing.id).state
            : housing.state,
      ));

  void goToTickets({
    String? id,
    TicketTypeModel? type,
    bool add = false,
    bool searchHousing = false,
    bool searchTransport = false,
  }) =>
      _onlyAuthenticated(RouterTicketsState(
        id: id,
        type: type,
        add: add,
        searchHousing: searchHousing,
        searchTransport: searchTransport,
      ).state);

  void toggleTicketTransport({String? transportId}) => state.maybeWhen(
        orElse: () => null,
        tickets: (stateConfig) => _onlyAuthenticated(
          stateConfig.copyWith(transportId: transportId).state,
        ),
      );

  void toggleTicketHousing({String? housingId}) => state.maybeWhen(
        orElse: () => null,
        tickets: (stateConfig) => _onlyAuthenticated(
          stateConfig.copyWith(housingId: housingId).state,
        ),
      );

  void toggleModal(bool value) => state.maybeWhen(
        orElse: () => null,
        tickets: (stateConfig) => emit(stateConfig.copyWith(modalVisible: value).state),
        transport: (stateConfig) => emit(stateConfig.copyWith(modalVisible: value).state),
        housing: (stateConfig) => emit(stateConfig.copyWith(modalVisible: value).state),
      );

  /// Implement the logic for what happens when the back button was called.
  ///
  /// Return `true` if the app navigated back or `false` if it's the root of the app.
  /// The value of the [result] argument is the value returned by the [Route].
  bool popRoute(dynamic result) => state.maybeWhen(
        register: () => goToRoot(),
        unknown: () => goToRoot(),
        home: (_, viewProfile) {
          if (viewProfile) {
            return goToRoot();
          }
          return false;
        },
        tickets: (stateConfig) {
          if (stateConfig.modalVisible) {
            return true;
          }
          if (stateConfig.popedState(result) != null) {
            emit(stateConfig.popedState(result)!);
            return true;
          }
          return goToRoot();
        },
        transport: (stateConfig) {
          if (stateConfig.modalVisible) {
            return true;
          }
          if (stateConfig.add || (stateConfig.id?.isNotEmpty ?? false)) {
            goToTransport();
            return true;
          }
          return goToRoot();
        },
        housing: (stateConfig) {
          if (stateConfig.modalVisible) {
            return true;
          }
          if (stateConfig.add || (stateConfig.id?.isNotEmpty ?? false)) {
            goToHousing();
            return true;
          }
          return goToRoot();
        },
        orElse: () => false,
      );

  /// Clear any non-null popResult after usage.
  void clearResult() => state.maybeWhen(
        orElse: () => null,
        tickets: (stateConfig) => emit(stateConfig.copyWith(popResult: null).state),
      );

  /// Method called by the overriden [RootRouterDelegate.setNewRoutePath] method.
  ///
  /// The incoming routerState is what is parsed by the implemented [RootRouterParser.parseRouteInformation].
  /// We need to carefully manage incoming paths because we need to make sure we do not show any private
  /// tot unauthenticated users.
  ///
  /// Because we need to use futures, we cannot return a synchronous value.
  Future<void> setNewRoutePath(RootRouterState parsedState) async => _initialWait(
        () => parsedState.map(
          initial: (_) => goToRoot(),
          unauthenticated: (_) => goToRoot(),
          register: _onlyUnauthenticated,
          home: _onlyAuthenticated,
          transport: _onlyAuthenticated,
          housing: _onlyAuthenticated,
          tickets: (tickets) {
            if (tickets.stateConfig.type == null) {
              goToRoot();
              return;
            }
            return _onlyAuthenticated(tickets);
          },
          unknown: (unkownState) => emit(unkownState),
        ),
      );

  /// --------------------EVERYTHING BELLOW THIS ARE HELPER METHODS--------------------
  ///
  /// They are here to help our cubit's logic. All methods in this part of the class must be private.

  /// Helper method used when [AuthenticationCubit] reports a new [AuthenticationState].
  ///
  /// The router needs to react whenever someone signed in, registered or signed out.
  /// Here we do just that.
  void _stateFromAuthState(AuthenticationState authState) {
    /// If the state is unkown, a.k.a. tried to access an unkown url we do nothing.
    if (state.isUknown) return;

    /// We only react if [AuthenticationState.unauthenticated] or [AuthenticationState.authenticated]
    /// are emitted.
    RootRouterState? newState = authState.maybeWhen(
      orElse: () => null,
      unauthenticated: () => const RootRouterState.unauthenticated(),
      authenticated: (user) {
        final goHome = state.maybeWhen(
          orElse: () => false,
          initial: () => true,
          unauthenticated: () => true,
          register: () => true,
        );
        if (goHome) goToRoot();
        return;
      },
    );

    if (newState != null) {
      emit(newState);
    }
  }

  /// Wait for the authentication process to get past the initial state.
  ///
  /// We need this to ensure the authentication process has finished checking if there is a user signed in or not.
  /// Otherwise we would end up in a situation where the state is changed to the parsed state then, afterwards,
  /// is changed into either [RootRouterState.unauthenticated] or [RootRouterState.unauthenticated.home].
  void _initialWait(VoidCallback callback) => _authCubit.state.maybeWhen(
        orElse: callback,
        initial: () => Utils.repoDelay().whenComplete(() => _initialWait(callback)),
      );

  /// Helper method to make sure the requested state is accessed only by authenticated users.
  void _onlyAuthenticated(RootRouterState routerState) => emit(_authCubit.state.maybeWhen(
        orElse: () => const RootRouterState.unauthenticated(),

        /// Before emitting the state we need to ensure the proper arguments are passed on.
        authenticated: (user) => routerState.maybeWhen(
          /// In case the state doesn't have any arguments needed to passed we return the state.
          orElse: () => routerState,

          /// In the case of the home state there are 2 arguments needed to passed so we pass them accordingly.
          ///
          /// The [RootRouterState.user] which should contain the currently authenticated [UserModel].
          /// This argument should be taken from the [AuthenticationState.authenticated] state to ensure the latest data is used.
          home: (_, viewProfile) => RootRouterState.home(
            user: user,
            viewProfile: viewProfile,
          ),
        ),
      ));

  /// Helper method to make sure the requested state is accessed only by unauthenticated users.
  ///
  /// Screens such as: [AuthenticationScreen], [RegisterScreen] and [SignInScreen] should be accessed only
  /// if the user is not signed in. If the user wants to access those screens he needs to sign out first.
  void _onlyUnauthenticated(RootRouterState routerState) => emit(_authCubit.state.maybeWhen(
        orElse: () => routerState,
        authenticated: (user) => RootRouterState.home(user: user),
      ));

  /// We close the stream subscription because it is good practice.
  ///
  /// Despite [RootRouterCubit] should only close when the app is closed.
  @override
  Future<void> close() async {
    await _authStateSub.cancel();
    return super.close();
  }
}
