import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/domain/core/operation_result.dart';
import 'package:refugee_help/domain/user/user_model.dart';
import 'package:refugee_help/domain/user/user_repository.dart';
import 'package:refugee_help/infrastructure/utils.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<UserState> {
  late final StreamSubscription<AuthenticationState> _authStateSub;
  late final StreamSubscription<OperationResult> _resultSub;
  final UserRepository _repository;

  UserCubit({required AuthenticationCubit authCubit})
      : _repository = UserRepository(),
        super(const UserState.initial()) {
    authCubit.state.maybeWhen(
      orElse: () => null,
      authenticated: (user) => _emitView(user),
    );
    _authStateSub = authCubit.stream.listen(_parseAuthState);
    _resultSub = _repository.resultStream.listen(_parseResultSub);
  }

  void _parseAuthState(AuthenticationState authState) => authState.maybeWhen(
        orElse: () => null,
        authenticated: (user) {
          state.maybeWhen(
            orElse: () => null,
            loading: (_) {
              emit(UserState.success("user_updated".tr()));
            },
          );
          _emitView(user);
          return;
        },
      );

  void _parseResultSub(OperationResult result) => result.when(
        failure: (message) => emit(UserState.failure(message)),
        success: (response) => emit(UserState.success(response)),
      );

  void _emitView(UserModel user) => emit(UserState.view(user));

  void toggleEdit() => state.maybeWhen(
        orElse: () => null,
        view: (user) => emit(UserState.edit(user)),
        edit: (user) => emit(UserState.view(user)),
      );

  Future<void> updateUser(UserModel user) async {
    emit(UserState.loading("updating_user".tr()));
    await Utils.repoDelay();
    await _repository.updateUser(user);
  }

  Future<void> toggleAvailability(UserModel user) async {
    await Utils.repoDelay();
    await _repository.updateAvailability(user);
  }

  @override
  Future<void> close() async {
    await _authStateSub.cancel();
    await _resultSub.cancel();
    await _repository.close();
    return super.close();
  }
}
