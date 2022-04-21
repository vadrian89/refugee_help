import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/domain/housing/housing_type_model.dart';

part 'list_housing_request_model.freezed.dart';

@freezed
class ListHousingRequestModel with _$ListHousingRequestModel {
  const factory ListHousingRequestModel({
    int? bedsAvailable,
    int? limit,
    bool? isAvailable,
    String? userId,
    String? county,
    String? city,
    HousingTypeModel? type,
  }) = _ListHousingRequestModel;
}
