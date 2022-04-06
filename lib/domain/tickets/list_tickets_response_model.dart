import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/domain/core/firestore_pagination_info.dart';

import 'ticket_model.dart';

part 'list_tickets_response_model.freezed.dart';

@freezed
class ListTicketsResponseModel with _$ListTicketsResponseModel {
  const factory ListTicketsResponseModel({
    required int totalRows,
    required List<TicketModel> list,
    FirestorePaginationInfo<TicketModel>? paginationInfo,
  }) = _ListTicketsResponseModel;

  factory ListTicketsResponseModel.empty() =>
      const ListTicketsResponseModel(totalRows: 0, list: []);
}
