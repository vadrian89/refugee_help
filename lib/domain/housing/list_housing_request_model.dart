import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_housing_request_model.freezed.dart';

@freezed
class ListHousingRequestModel with _$ListHousingRequestModel {
  const factory ListHousingRequestModel({
    int? bedsAvailable,
    int? limit,
    bool? isAvailable,
    String? userId,
  }) = _ListHousingRequestModel;
}
