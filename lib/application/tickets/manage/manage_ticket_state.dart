part of 'manage_ticket_cubit.dart';

@freezed
class ManageTicketState with _$ManageTicketState {
  const factory ManageTicketState.initial() = _Initial;
  const factory ManageTicketState.view(TicketModel ticket) = _View;
  const factory ManageTicketState.edit(TicketModel ticket) = _Edit;
  const factory ManageTicketState.loading(String message) = _Loading;
  const factory ManageTicketState.success({
    String? message,
    @Default(false) bool popScreen,
  }) = _Success;
  const factory ManageTicketState.failure(String message) = _Failure;
}
