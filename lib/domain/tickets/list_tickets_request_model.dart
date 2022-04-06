import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/domain/core/firestore_pagination_info.dart';
import 'package:refugee_help/domain/tickets/ticket_type_model.dart';

part 'list_tickets_request_model.freezed.dart';

@freezed
class ListTicketsRequestModel with _$ListTicketsRequestModel {
  const factory ListTicketsRequestModel({
    @Default(20) int limit,
    TicketTypeModel? type,
    @Default(false) bool goBack,
    FirestorePaginationInfo? paginationInfo,
    String? userId,
  }) = _ListTicketsRequestModel;
}
