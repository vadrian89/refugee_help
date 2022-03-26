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
  StreamSubscription<TransportModel?>? _transportSub;
  late final StreamSubscription<OperationResult> _resultSub;

  ManageTransportCubit({required AuthenticationCubit authCubit, String? id})
      : _repository = TransportRepository(),
        super(const ManageTransportState.initial()) {
    _parseAuthStateSub(authCubit.state);
    _authStateSub = authCubit.stream.listen(_parseAuthStateSub);
    _resultSub = _repository.resultStream.listen(_parseResultSub);
    if (id != null) {
      _transportSub = _repository.docStream(id).listen(_parseModelSub);
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

  void _parseModelSub([TransportModel? transport]) {
    if (transport != null) {
      state.maybeWhen(
        orElse: () => null,
        loading: (_) => emit(ManageTransportState.success(message: "saved_changes".tr())),
      );
      _emitView(transport);
    } else {
      emit(const ManageTransportState.success());
    }
  }

  void toggleEdit() => state.maybeMap(
        orElse: () => null,
        view: (view) => emit(ManageTransportState.edit(view.transport)),
        edit: (edit) => _emitView(edit.transport),
      );

  void _emitView(TransportModel transport) => emit(ManageTransportState.view(
        transport: transport,
        canUpdate: _user!.id == transport.user!.id,
      ));

  Future<void> save(TransportModel transport) async {
    emit(ManageTransportState.loading("saving".tr()));
    await Utils.repoDelay();
    if (transport.id != null) {
      await _repository.update(transport);
    } else {
      await _repository.add(transport.copyWith(user: UserInfoModel.fromUser(_user!)));
    }
  }

  Future<void> delete(TransportModel transport) async {
    await _transportSub?.cancel();
    emit(ManageTransportState.loading("deleting_transport".tr()));
    await Utils.repoDelay();
    await _repository.delete(transport, popScreen: true);
  }

  @override
  Future<void> close() async {
    await _authStateSub.cancel();
    await _transportSub?.cancel();
    await _resultSub.cancel();
    return super.close();
  }
}
