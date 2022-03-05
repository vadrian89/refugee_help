import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/domain/core/operation_result.dart';
import 'package:refugee_help/domain/authentication/authentication_repository.dart';
import 'package:refugee_help/domain/user/user_model.dart';

import '../../infrastructure/utils.dart';

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

  /// Initialise [_operationResultSub] and start parsing the incoming [OperationResult] objects.
  void _initOperationResultSub() => _operationResultSub = _repo.resultStream.listen(
        (result) => result.when(
          failure: (message) {
            emit(AuthenticationState.failure(message));
            emit(const AuthenticationState.unauthenticated());
            return;
          },
          success: (response) {
            if (response is String || response == null) {
              emit(AuthenticationState.success(response));
            }
            return;
          },
        ),
      );

  /// Initialise [_profileStreamSub] and start parsing the incoming [UserModel] objects.
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

  Future<void> signInWithEmail({required String email, required String password}) async {
    emit(AuthenticationState.loading("signing_in".tr()));
    await Utils.repoDelay();
    await _repo.signInUser(email: email, password: password);
  }

  Future<void> signInWithGoogle() async {
    emit(AuthenticationState.loading("signing_in".tr()));
    await _repo.signInWithGoogle();
  }

  Future<void> resetPassword(String email) async {
    emit(AuthenticationState.loading("sending_password_reset".tr()));
    await Utils.repoDelay();
    await _repo.sendPasswordReset(email);
  }

  void signOut() => _repo.signOut();

  /// Clean up resources used by the cubit.
  @override
  Future<void> close() async {
    await _operationResultSub.cancel();
    await _profileStreamSub.cancel();
    await _repo.close();
    return super.close();
  }
}
