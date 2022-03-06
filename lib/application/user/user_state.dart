part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.view(UserModel user) = _View;
  const factory UserState.edit(UserModel user) = _Edit;
  const factory UserState.loading(String message) = _Loading;
  const factory UserState.success([String? message]) = _Success;
  const factory UserState.failure(String message) = _Failure;
}
