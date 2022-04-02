import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/domain/core/firestore_pagination_info.dart';

import 'transport_type_model.dart';

part 'transport_request.freezed.dart';

@freezed
class TransportRequest with _$TransportRequest {
  const factory TransportRequest({
    int? seatsAvailable,
    TransportTypeModel? transportType,
    @Default(true) bool? isAvailable,
    @Default(false) bool goBack,
    FirestorePaginationInfo? paginationInfo,
  }) = _TransportRequest;
}
