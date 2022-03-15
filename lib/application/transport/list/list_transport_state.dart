part of 'list_transport_cubit.dart';

@freezed
class ListTransportState with _$ListTransportState {
  const factory ListTransportState.initial() = _Initial;
  const factory ListTransportState.view(List<TransportModel> list) = _View;
  const factory ListTransportState.deleting() = _Deleting;
  const factory ListTransportState.failure(String message) = _Failure;
  const factory ListTransportState.success(String message) = _Success;
}
