import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/domain/core/firestore_pagination_info.dart';
import 'package:refugee_help/domain/tickets/ticket_type_model.dart';

part 'ticket_request.freezed.dart';

@freezed
class TicketRequest with _$TicketRequest {
  const factory TicketRequest({
    TicketTypeModel? type,
    @Default(false) bool goBack,
    FirestorePaginationInfo? paginationInfo,
  }) = _TicketRequest;
}
