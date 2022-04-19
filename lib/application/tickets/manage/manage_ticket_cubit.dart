import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/domain/core/operation_result.dart';
import 'package:refugee_help/domain/tickets/ticket_model.dart';
import 'package:refugee_help/domain/tickets/ticket_status_model.dart';
import 'package:refugee_help/domain/tickets/ticket_type_model.dart';
import 'package:refugee_help/domain/tickets/tickets_repository.dart';
import 'package:refugee_help/domain/user/user_info_model.dart';
import 'package:refugee_help/domain/user/user_model.dart';
import 'package:refugee_help/infrastructure/utils.dart';

part 'manage_ticket_state.dart';
part 'manage_ticket_cubit.freezed.dart';

class ManageTicketCubit extends Cubit<ManageTicketState> {
  late final StreamSubscription<AuthenticationState> _authStateSub;
  UserModel? _user;
  final TicketsRepository _repository;
  StreamSubscription<TicketModel?>? _ticketSub;
  late final StreamSubscription<OperationResult> _resultSub;
  final TicketTypeModel _type;

  ManageTicketCubit({
    required AuthenticationCubit authCubit,
    String? id,
    required TicketTypeModel type,
  })  : _type = type,
        _repository = TicketsRepository(),
        super(const ManageTicketState.initial()) {
    _parseAuthStateSub(authCubit.state);
    _authStateSub = authCubit.stream.listen(_parseAuthStateSub);
    _resultSub = _repository.resultStream.listen(_parseResultSub);
    if (id != null) {
      _ticketSub = _repository.docStream(id).listen(_parseModelSub);
    } else {
      emit(ManageTicketState.edit(TicketModel.newTicket(_type)));
    }
  }

  void _parseAuthStateSub(AuthenticationState authState) => authState.maybeWhen(
        orElse: () => null,
        authenticated: (user) => _user = user,
      );

  void _parseResultSub(OperationResult result) => result.when(
        failure: (message) => emit(ManageTicketState.failure(message)),
        success: (response) {
          if (response is bool) {
            emit(ManageTicketState.success(popScreen: response));
          }
          return;
        },
      );

  void _parseModelSub([TicketModel? ticket]) {
    if (ticket != null) {
      if (ticket.type != _type) {
        emit(const ManageTicketState.unkown());
        return;
      }
      state.maybeWhen(
        orElse: () => null,
        loading: (_) => emit(ManageTicketState.success(message: "saved_changes".tr())),
      );
      _emitView(ticket);
    } else {
      emit(const ManageTicketState.success());
    }
  }

  void toggleEdit() => state.maybeWhen(
        orElse: () => null,
        view: (ticket) => emit(ManageTicketState.edit(ticket)),
        edit: _emitView,
      );

  void _emitView(TicketModel ticket) => emit(ManageTicketState.view(ticket));

  Future<void> save(TicketModel ticket) async {
    emit(ManageTicketState.loading("saving".tr()));
    await Utils.repoDelay();
    if (ticket.id != null) {
      await _repository.update(ticket);
    } else {
      await _repository.add(ticket.copyWith(dispatcher: UserInfoModel.fromUser(_user!)));
    }
  }

  Future<void> updateStatus(TicketModel ticket) async {
    emit(ManageTicketState.loading("saving".tr()));
    await Utils.repoDelay();
    TicketModel updatedTicket = ticket;
    if (ticket.status == TicketStatusModel.finished() ||
        ticket.status == TicketStatusModel.canceled()) {
      updatedTicket = ticket.updateFeedback(ticket.feedback!.copyWith(
        user: UserInfoModel.fromUser(_user!),
      ));
    }
    await _repository.updateStatus(updatedTicket);
  }

  Future<void> delete(TicketModel ticket) async {
    await _ticketSub?.cancel();
    emit(ManageTicketState.loading("ticket.deleting".tr()));
    await Utils.repoDelay();
    await _repository.delete(ticket, popScreen: true);
  }

  @override
  Future<void> close() async {
    await _authStateSub.cancel();
    await _ticketSub?.cancel();
    await _resultSub.cancel();
    return super.close();
  }
}
