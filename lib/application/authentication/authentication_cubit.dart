import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/domain/core/operation_result.dart';
import 'package:refugee_help/domain/authentication/authentication_repository.dart';
import 'package:refugee_help/domain/user/user_model.dart';

part 'authentication_state.dart';
part 'authentication_cubit.freezed.dart';

/// The app's authentication logic.
///
/// Here we: listen to authentication status changes (sign in, register, sign out),
/// listen to user changes and process OAuth-based authentication (not included at the moment).
///
/// We do not implement sign in/register, in here, because they are to complex and it would
/// bring unwanted problems in implementing the authentication logic and router's logic.
class AuthenticationCubit extends Cubit<AuthenticationState> {
  /// Repository class for the authentication process.
  final AuthenticationRepository _repo;

  /// Stream to listen for profile changes.
  late final StreamSubscription<UserModel?> _profileStreamSub;

  /// Stream to listen for any errors which might occur in the authentication process.
  late final StreamSubscription<OperationResult> _operationResultSub;

  AuthenticationCubit({required AuthenticationRepository repo})
      : _repo = repo,
        super(const AuthenticationState.initial()) {
    _initOperationResultSub();
    _initProfileStateSub();
  }

  /// Private method which initialises [_operationResultSub].
  ///
  /// There is no need to manage success.
  void _initOperationResultSub() => _operationResultSub = _repo.resultStream.listen(
        (result) => result.when(
          failure: (message) {
            emit(AuthenticationState.failure(message));
            emit(const AuthenticationState.unauthenticated());
          },
          success: (_) => null,
        ),
      );

  /// Private method which initialises [_profileStreamSub].
  void _initProfileStateSub() {
    _profileStreamSub = _repo.profileStream.listen(
      (user) {
        if (user != null && !user.isAnonymous) {
          emit(AuthenticationState.authenticated(user));
        } else {
          emit(const AuthenticationState.unauthenticated());
        }
      },
    );
  }

  /// Public method sign out the user.
  void signOut() => _repo.signOut();

  /// Method, provided by [BlocBase], used to clean up resources used by the cubit.
  @override
  Future<void> close() async {
    await _operationResultSub.cancel();
    await _profileStreamSub.cancel();
    await _repo.close();
    return super.close();
  }
}
