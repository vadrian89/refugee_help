import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/domain/core/operation_result.dart';
import 'package:refugee_help/domain/transport/transport_model.dart';
import 'package:refugee_help/domain/transport/transport_repository.dart';
import 'package:refugee_help/domain/transport/list_transport_request_model.dart';
import 'package:refugee_help/domain/user/user_model.dart';
import 'package:refugee_help/infrastructure/utils.dart';

part 'list_transport_state.dart';
part 'list_transport_cubit.freezed.dart';

class ListTransportCubit extends Cubit<ListTransportState> {
  late final TransportRepository _repo;
  late final StreamSubscription<OperationResult> _resultSub;
  StreamSubscription<List<TransportModel>>? _listSub;
  UserModel? _user;

  ListTransportCubit({required AuthenticationCubit authCubit})
      : _repo = TransportRepository(),
        super(const ListTransportState.initial()) {
    _user = authCubit.state.user;
    _resultSub = _repo.resultStream.listen(_parseResult);
  }

  void _parseResult(OperationResult result) => result.when(
        success: (response) {
          if (response is String) {
            emit(ListTransportState.success(response));
          }
          return;
        },
        failure: (message) => emit(ListTransportState.failure(message)),
      );

  Future<void> fetchList(ListTransportRequestModel request, {bool all = false}) async {
    final isLoading = state.maybeWhen(orElse: () => false, loading: (_) => true);
    if (isLoading) {
      return;
    }
    state.maybeMap(
      initial: (_) => null,
      orElse: () => emit(ListTransportState.loading("retrieving_data".tr())),
    );
    final updatedRequest = request.copyWith(userId: all ? null : _user!.id);
    await _listSub?.cancel();
    _listSub = _repo.listStream(updatedRequest).listen(_parseListSub);
  }

  void _parseListSub(List<TransportModel> list) {
    state.maybeWhen(
      orElse: () => null,
      loading: (_) => emit(const ListTransportState.success("")),
      deleting: () => emit(ListTransportState.success("deleted_transport".tr())),
    );
    emit(ListTransportState.view(list));
  }

  Future<void> delete(TransportModel model) async {
    emit(const ListTransportState.deleting());
    await Utils.repoDelay();
    await _repo.delete(model);
  }

  @override
  Future<void> close() async {
    await _repo.close();
    await _listSub?.cancel();
    await _resultSub.cancel();
    return super.close();
  }
}
