import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/domain/core/firestore_pagination_info.dart';
import 'package:refugee_help/domain/core/operation_result.dart';
import 'package:refugee_help/domain/tickets/ticket_model.dart';
import 'package:refugee_help/domain/tickets/ticket_request.dart';
import 'package:refugee_help/domain/tickets/ticket_type_model.dart';
import 'package:refugee_help/domain/tickets/tickets_repository.dart';
import 'package:refugee_help/domain/user/user_model.dart';
import 'package:refugee_help/infrastructure/utils.dart';

part 'list_tickets_state.dart';
part 'list_tickets_cubit.freezed.dart';

class ListTicketsCubit extends Cubit<ListTicketsState> {
  late final TicketsRepository _repository;
  late final StreamSubscription<OperationResult> _resultSub;
  StreamSubscription<List<TicketModel>>? _listSub;
  UserModel? _user;
  List<TicketModel> _list = const [];
  static const int _pageLimit = 20;
  int _currentPage = 0;
  int _totalRows = 0;
  FirestorePaginationInfo? _paginationInfo;
  final TicketTypeModel _type;

  int get _limit => _pageLimit * _currentPage;
  String? get _userId => (_user?.isPrivileged ?? true) ? null : _user?.id;
  bool get _stateInProgress => state.maybeMap(orElse: () => false, loading: (_) => true);

  ListTicketsCubit({
    required TicketTypeModel type,
    required AuthenticationCubit authCubit,
  })  : _type = type,
        _repository = TicketsRepository(),
        super(const ListTicketsState.initial()) {
    _user = authCubit.state.user;
    _resultSub = _repository.resultStream.listen(_parseResult);
  }

  void _parseResult(OperationResult result) => result.when(
        success: (response) {
          if (response is String) {
            emit(ListTicketsState.success(response));
          }
          if (response is FirestorePaginationInfo) {
            _paginationInfo = response;
          }
          if (response is int) {
            emit(const ListTicketsState.success(""));
            _totalRows = response;
          }
          return;
        },
        failure: (message) => emit(ListTicketsState.failure(message)),
      );

  Future<void> fetchList({TicketRequest? request, bool isTable = false}) async {
    if (_stateInProgress) {
      return;
    }
    emit(ListTicketsState.loading((request != null) ? "retrieving_data".tr() : ""));
    await _listSub?.cancel();
    if (request?.goBack ?? false) {
      _currentPage--;
    } else {
      _currentPage++;
    }
    if (_currentPage == 0) {
      _paginationInfo = null;
    }
    _listSub = _repository
        .listStream(
          userId: _userId,
          limit: isTable ? _pageLimit : _limit,
          request: (request ?? const TicketRequest()).copyWith(
            type: _type,
            paginationInfo: _paginationInfo,
          ),
        )
        .listen(_parseListSub);
  }

  void _parseListSub(List<TicketModel> list) {
    _list = list;
    state.maybeWhen(
      orElse: () => null,
      deleting: () => emit(ListTicketsState.success("deleted_ticket".tr())),
    );
    emit(ListTicketsState.view(
      list: _list,
      page: _currentPage,
      pageLimit: _pageLimit,
      totalRows: _totalRows,
    ));
  }

  Future<void> delete(TicketModel model) async {
    emit(const ListTicketsState.deleting());
    await Utils.repoDelay();
    await _repository.delete(model);
  }

  @override
  Future<void> close() async {
    await _repository.close();
    await _listSub?.cancel();
    await _resultSub.cancel();
    return super.close();
  }
}
