part of 'authentication_cubit.dart';

@freezed

/// Class which represents the state of the authentication process.
class AuthenticationState with _$AuthenticationState {
  UserModel? get user => maybeWhen(orElse: () => null, authenticated: (user) => user);

  const AuthenticationState._();

  /// [AuthenticationState.initial] is the initial state of the authentication process.
  const factory AuthenticationState.initial() = _Initial;

  /// [AuthenticationState.unauthenticated] should be emitted if the user is not signed in.
  const factory AuthenticationState.unauthenticated() = _Unauthenticated;

  /// [AuthenticationState.authenticated] should be emitted after the user has signed in or if he was already signed in.
  const factory AuthenticationState.authenticated(UserModel user) = _Authenticated;

  /// Emit [AuthenticationState.loading] whenever an operation is in progress.
  const factory AuthenticationState.loading(String message) = _Loading;

  /// Emit [AuthenticationState.success] whenever operation ended successfully.
  const factory AuthenticationState.success([String? message]) = _Success;

  /// Emit [AuthenticationState.failure] whenever an error has occured in the authentication process.
  const factory AuthenticationState.failure(String message) = _Failure;
}
