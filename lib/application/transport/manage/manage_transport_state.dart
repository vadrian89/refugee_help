part of 'manage_transport_cubit.dart';

@freezed
class ManageTransportState with _$ManageTransportState {
  const factory ManageTransportState.initial() = _Initial;
  const factory ManageTransportState.view(TransportModel model) = _View;
  const factory ManageTransportState.edit(TransportModel model) = _Edit;
  const factory ManageTransportState.loading(String message) = _Loading;
  const factory ManageTransportState.success({
    String? message,
    @Default(false) bool popScreen,
  }) = _Success;
  const factory ManageTransportState.failure(String message) = _Failure;
}
