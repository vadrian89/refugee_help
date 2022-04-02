part of 'list_transport_cubit.dart';

@freezed
class ListTransportState with _$ListTransportState {
  const factory ListTransportState.initial() = _Initial;
  const factory ListTransportState.view({
    required List<TransportModel> list,
    required int page,
    required int pageLimit,
    required int totalRows,
  }) = _View;
  const factory ListTransportState.deleting() = _Deleting;
  const factory ListTransportState.loading(String message) = _Loading;
  const factory ListTransportState.failure(String message) = _Failure;
  const factory ListTransportState.success(String message) = _Success;
}
