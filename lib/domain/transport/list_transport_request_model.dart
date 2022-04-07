import 'package:freezed_annotation/freezed_annotation.dart';
import 'transport_type_model.dart';

part 'list_transport_request_model.freezed.dart';

@freezed
class ListTransportRequestModel with _$ListTransportRequestModel {
  const factory ListTransportRequestModel({
    int? seatsAvailable,
    TransportTypeModel? transportType,
    int? limit,
    bool? isAvailable,
    String? userId,
  }) = _ListTransportRequestModel;
}
