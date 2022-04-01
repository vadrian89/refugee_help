import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_request.freezed.dart';

@freezed
class TicketRequest with _$TicketRequest {
  const factory TicketRequest({
    String? docId,
    @Default(false) bool goBack,
  }) = _TicketRequest;
}
