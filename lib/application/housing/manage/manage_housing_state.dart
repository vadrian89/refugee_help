part of 'manage_housing_cubit.dart';

@freezed
class ManageHousingState with _$ManageHousingState {
  const factory ManageHousingState.initial() = _Initial;
  const factory ManageHousingState.view({
    required HousingModel housing,
    @Default(false) bool? showUserInfo,
    @Default(false) bool? canUpdate,
  }) = _View;
  const factory ManageHousingState.edit(HousingModel housing) = _Edit;
  const factory ManageHousingState.loading(String message) = _Loading;
  const factory ManageHousingState.success({
    String? message,
    @Default(false) bool popScreen,
  }) = _Success;
  const factory ManageHousingState.failure(String message) = _Failure;
}
