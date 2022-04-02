part of 'list_tickets_cubit.dart';

@freezed
class ListTicketsState with _$ListTicketsState {
  const factory ListTicketsState.initial() = _Initial;
  const factory ListTicketsState.view({
    required List<TicketModel> list,
    required int page,
    required int pageLimit,
    required int totalRows,
  }) = _View;
  const factory ListTicketsState.deleting() = _Deleting;
  const factory ListTicketsState.loading(String message) = _Loading;
  const factory ListTicketsState.failure(String message) = _Failure;
  const factory ListTicketsState.success(String message) = _Success;
}
