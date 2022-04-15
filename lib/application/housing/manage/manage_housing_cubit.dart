import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/domain/core/operation_result.dart';
import 'package:refugee_help/domain/housing/housing_model.dart';
import 'package:refugee_help/domain/housing/housing_repository.dart';
import 'package:refugee_help/domain/user/user_info_model.dart';
import 'package:refugee_help/domain/user/user_model.dart';
import 'package:refugee_help/infrastructure/utils.dart';

part 'manage_housing_state.dart';
part 'manage_housing_cubit.freezed.dart';

class ManageHousingCubit extends Cubit<ManageHousingState> {
  late final StreamSubscription<AuthenticationState> _authStateSub;
  UserModel? _user;
  final HousingRepository _repository;
  StreamSubscription<HousingModel?>? _housingSub;
  late final StreamSubscription<OperationResult> _resultSub;

  ManageHousingCubit({required AuthenticationCubit authCubit, String? id})
      : _repository = HousingRepository(),
        super(const ManageHousingState.initial()) {
    _parseAuthStateSub(authCubit.state);
    _authStateSub = authCubit.stream.listen(_parseAuthStateSub);
    _resultSub = _repository.resultStream.listen(_parseResultSub);
    if (id != null) {
      _housingSub = _repository.docStream(id).listen(_parseModelSub);
    } else {
      emit(const ManageHousingState.edit(HousingModel()));
    }
  }

  void _parseAuthStateSub(AuthenticationState authState) => authState.maybeWhen(
        orElse: () => null,
        authenticated: (user) => _user = user,
      );

  void _parseResultSub(OperationResult result) => result.when(
        failure: (message) => emit(ManageHousingState.failure(message)),
        success: (response) {
          if (response is bool) {
            emit(ManageHousingState.success(popScreen: response));
          }
          return;
        },
      );

  void _parseModelSub([HousingModel? housing]) {
    if (housing != null) {
      state.maybeWhen(
        orElse: () => null,
        loading: (_) => emit(ManageHousingState.success(message: "saved_changes".tr())),
      );
      _emitView(housing);
    } else {
      emit(const ManageHousingState.success());
    }
  }

  void toggleEdit() => state.maybeMap(
        orElse: () => null,
        view: (view) => emit(ManageHousingState.edit(view.housing)),
        edit: (edit) => _emitView(edit.housing),
      );

  void _emitView(HousingModel housing) => emit(ManageHousingState.view(
        housing: housing,
        canUpdate: _user!.id == housing.user!.id,
        showUserInfo: _user?.isPrivileged ?? false,
      ));

  Future<void> save(HousingModel housing) async {
    emit(ManageHousingState.loading("saving".tr()));
    await Utils.repoDelay();
    if (housing.id != null) {
      await _repository.update(housing);
    } else {
      await _repository.add(housing.copyWith(user: UserInfoModel.fromUser(_user!)));
    }
  }

  Future<void> delete(HousingModel housing) async {
    await _housingSub?.cancel();
    emit(ManageHousingState.loading("deleting".tr()));
    await Utils.repoDelay();
    await _repository.delete(housing, popScreen: true);
  }

  @override
  Future<void> close() async {
    await _authStateSub.cancel();
    await _housingSub?.cancel();
    await _resultSub.cancel();
    return super.close();
  }
}
