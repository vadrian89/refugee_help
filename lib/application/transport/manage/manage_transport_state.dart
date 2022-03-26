part of 'manage_transport_cubit.dart';

@freezed
class ManageTransportState with _$ManageTransportState {
  const factory ManageTransportState.initial() = _Initial;
  const factory ManageTransportState.view({
    required TransportModel transport,
    @Default(false) bool? showUserInfo,
    @Default(false) bool? canUpdate,
  }) = _View;
  const factory ManageTransportState.edit(TransportModel transport) = _Edit;
  const factory ManageTransportState.loading(String message) = _Loading;
  const factory ManageTransportState.success({
    String? message,
    @Default(false) bool popScreen,
  }) = _Success;
  const factory ManageTransportState.failure(String message) = _Failure;
}
