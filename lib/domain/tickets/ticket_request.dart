import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/domain/core/firestore_pagination_info.dart';

part 'ticket_request.freezed.dart';

@freezed
class TicketRequest with _$TicketRequest {
  const factory TicketRequest({
    @Default(false) bool goBack,
    FirestorePaginationInfo? paginationInfo,
  }) = _TicketRequest;
}
