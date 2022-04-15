part of 'list_housing_cubit.dart';

@freezed
class ListHousingState with _$ListHousingState {
  const factory ListHousingState.initial() = _Initial;
  const factory ListHousingState.view(List<HousingModel> list) = _View;
  const factory ListHousingState.deleting() = _Deleting;
  const factory ListHousingState.loading(String message) = _Loading;
  const factory ListHousingState.failure(String message) = _Failure;
  const factory ListHousingState.success(String message) = _Success;
}
