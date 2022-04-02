import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/domain/core/firestore_pagination_info.dart';
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
  static const int _pageLimit = 20;
  int _currentPage = 0;
  int _totalRows = 0;
  FirestorePaginationInfo? _paginationInfo;

  int get _limit => _pageLimit * _currentPage;
  String? get _userId => (_user?.isPrivileged ?? true) ? null : _user?.id;
  bool get _stateInProgress => state.maybeMap(orElse: () => false, loading: (_) => true);

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
          if (response is FirestorePaginationInfo) {
            _paginationInfo = response;
          }
          if (response is int) {
            emit(const ListTransportState.success(""));
            _totalRows = response;
          }

          return;
        },
        failure: (message) => emit(ListTransportState.failure(message)),
      );

  Future<void> fetchList({TransportRequest? request, bool isTable = false}) async {
    if (_stateInProgress) {
      return;
    }
    emit(ListTransportState.loading((request != null) ? "retrieving_data".tr() : ""));
    await _listSub?.cancel();
    if (request?.goBack ?? false) {
      _currentPage--;
    } else {
      _currentPage++;
    }
    if (_currentPage == 0) {
      _paginationInfo = null;
    }
    _listSub = _repo
        .listStream(
          userId: _userId,
          limit: isTable ? _pageLimit : _limit,
          request: request?.copyWith(paginationInfo: _paginationInfo),
        )
        .listen(_parseList);
  }

  void _parseList(List<TransportModel> list) {
    _list = list;
    state.maybeWhen(
      orElse: () => null,
      deleting: () => emit(ListTransportState.success("deleted_transport".tr())),
    );
    emit(ListTransportState.view(
      list: _list,
      page: _currentPage,
      pageLimit: _pageLimit,
      totalRows: _totalRows,
    ));
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
