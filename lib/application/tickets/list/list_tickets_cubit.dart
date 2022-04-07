import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/domain/core/operation_result.dart';
import 'package:refugee_help/domain/tickets/ticket_model.dart';
import 'package:refugee_help/domain/tickets/list_tickets_request_model.dart';
import 'package:refugee_help/domain/tickets/ticket_type_model.dart';
import 'package:refugee_help/domain/tickets/tickets_repository.dart';
import 'package:refugee_help/domain/user/user_model.dart';
import 'package:refugee_help/infrastructure/utils.dart';

part 'list_tickets_state.dart';
part 'list_tickets_cubit.freezed.dart';

class ListTicketsCubit extends Cubit<ListTicketsState> {
  final TicketTypeModel type;
  final TicketsRepository _repo;

  late final StreamSubscription<OperationResult> _resultSub;

  StreamSubscription<List<TicketModel>>? _listSub;
  UserModel? _user;
  String? get _userId => (_user?.isPrivileged ?? true) ? null : _user?.id;

  ListTicketsCubit({
    required this.type,
    required AuthenticationCubit authCubit,
  })  : _repo = TicketsRepository(),
        super(const ListTicketsState.initial()) {
    _user = authCubit.state.user;
    _resultSub = _repo.resultStream.listen(_parseResult);
  }

  void _parseResult(OperationResult result) => result.when(
        success: (response) {
          if (response is String) {
            emit(ListTicketsState.success(response));
          }
          return;
        },
        failure: (message) => emit(ListTicketsState.failure(message)),
      );

  Future<void> fetchList(ListTicketsRequestModel request) async {
    final isLoading = state.maybeWhen(orElse: () => false, loading: (_) => true);
    if (isLoading) {
      return;
    }
    state.maybeMap(
      initial: (_) => null,
      orElse: () => emit(ListTicketsState.loading("retrieving_data".tr())),
    );
    final updatedRequest = request.copyWith(
      type: type,
      transportOwnerId: _userId,
    );
    await _listSub?.cancel();
    _listSub = _repo.listStream(updatedRequest).listen(_parseListSub);
  }

  Future<void> _parseListSub(List<TicketModel> list) async {
    state.maybeWhen(
      orElse: () => null,
      loading: (_) => emit(const ListTicketsState.success("")),
      deleting: () => emit(ListTicketsState.success("deleted_ticket".tr())),
    );
    emit(ListTicketsState.view(list));
  }

  Future<void> delete(TicketModel model) async {
    emit(const ListTicketsState.deleting());
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
