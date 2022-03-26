import 'package:freezed_annotation/freezed_annotation.dart';

import 'transport_type_model.dart';

part 'transport_request.freezed.dart';

@freezed
class TransportRequest with _$TransportRequest {
  const factory TransportRequest({
    int? seatsAvailable,
    TransportTypeModel? transportType,
    @Default(true) bool? isAvailable,
  }) = _TransportRequest;
}
