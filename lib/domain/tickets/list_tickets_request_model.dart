import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/domain/tickets/ticket_type_model.dart';

part 'list_tickets_request_model.freezed.dart';

@freezed
class ListTicketsRequestModel with _$ListTicketsRequestModel {
  const factory ListTicketsRequestModel({
    int? limit,
    TicketTypeModel? type,
    String? ownerId,
  }) = _ListTicketsRequestModel;
}
