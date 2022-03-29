import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/domain/core/operation_result.dart';
import 'package:refugee_help/domain/transport/transport_model.dart';
import 'package:refugee_help/domain/transport/transport_repository.dart';
import 'package:refugee_help/domain/transport/transport_request.dart';
import 'package:refugee_help/domain/user/user_model.dart';
import 'package:refugee_help/infrastructure/utils.dart';

part 'list_transport_state.dart';
part 'list_transport_cubit.freezed.dart';

class ListTransportCubit extends Cubit<ListTransportState> {
  late final TransportRepository _repo;
  late final StreamSubscription<OperationResult> _resultSub;
  StreamSubscription<List<TransportModel>>? _listSub;
  UserModel? _user;
  List<TransportModel> _list = const [];
  static const int _pageLimit = 500;
  int _currentPage = 0;

  int get _limit => _pageLimit * _currentPage;
  String? get _userId => (_user?.isPrivileged ?? true) ? null : _user?.id;

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

  Future<void> fetchList({TransportRequest? request}) async {
    emit(const ListTransportState.loading(""));
    await Utils.repoDelay();
    await _listSub?.cancel();
    _currentPage++;
    _listSub = _repo
        .listStream(limit: (request != null) ? 1000 : _limit, userId: _userId, request: request)
        .listen(_parseList);
  }

  void _parseList(List<TransportModel> list) {
    _list = list;
    state.maybeWhen(
      orElse: () => null,
      deleting: () => emit(ListTransportState.success("deleted_transport".tr())),
    );
    emit(ListTransportState.view(_list));
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
