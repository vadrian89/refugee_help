import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/domain/core/operation_result.dart';
import 'package:refugee_help/domain/transport/transport_model.dart';
import 'package:refugee_help/domain/transport/transport_repository.dart';
import 'package:refugee_help/domain/user/user_info_model.dart';
import 'package:refugee_help/domain/user/user_model.dart';
import 'package:refugee_help/infrastructure/utils.dart';

part 'manage_transport_state.dart';
part 'manage_transport_cubit.freezed.dart';

class ManageTransportCubit extends Cubit<ManageTransportState> {
  late final StreamSubscription<AuthenticationState> _authStateSub;
  UserModel? _user;
  final TransportRepository _repository;
  StreamSubscription<TransportModel?>? _modelSub;
  late final StreamSubscription<OperationResult> _resultSub;

  ManageTransportCubit({required AuthenticationCubit authCubit, String? id})
      : _repository = TransportRepository(),
        super(const ManageTransportState.initial()) {
    _parseAuthStateSub(authCubit.state);
    _authStateSub = authCubit.stream.listen(_parseAuthStateSub);
    _resultSub = _repository.resultStream.listen(_parseResultSub);
    if (id != null) {
      _modelSub = _repository.docStream(id).listen(_parseModelSub);
    } else {
      emit(const ManageTransportState.edit(TransportModel()));
    }
  }

  void _parseAuthStateSub(AuthenticationState authState) => authState.maybeWhen(
        orElse: () => null,
        authenticated: (user) => _user = user,
      );

  void _parseResultSub(OperationResult result) => result.when(
        failure: (message) => emit(ManageTransportState.failure(message)),
        success: (response) {
          if (response is bool) {
            emit(ManageTransportState.success(popScreen: response));
          }
          return;
        },
      );

  void _parseModelSub([TransportModel? model]) {
    if (model != null) {
      state.maybeWhen(
        orElse: () => null,
        loading: (_) => emit(ManageTransportState.success(message: "saved_changes".tr())),
      );
      emit(ManageTransportState.view(model));
    } else {
      emit(const ManageTransportState.success());
    }
  }

  void toggleEdit() => state.maybeWhen(
        orElse: () => null,
        view: (model) => emit(ManageTransportState.edit(model)),
        edit: (model) => emit(ManageTransportState.view(model)),
      );

  Future<void> save(TransportModel model) async {
    emit(ManageTransportState.loading("saving".tr()));
    await Utils.repoDelay();
    if (model.id != null) {
      await _repository.update(model);
    } else {
      await _repository.add(model.copyWith(user: UserInfoModel.fromUser(_user!)));
    }
  }

  Future<void> delete(TransportModel model) async {
    await _modelSub?.cancel();
    emit(ManageTransportState.loading("deleting_transport".tr()));
    await Utils.repoDelay();
    await _repository.delete(model, popScreen: true);
  }

  @override
  Future<void> close() async {
    await _authStateSub.cancel();
    await _modelSub?.cancel();
    await _resultSub.cancel();
    return super.close();
  }
}
