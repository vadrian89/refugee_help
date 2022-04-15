// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/domain/user/user_info_model.dart';

import 'housing_model.dart';

part 'housing_info_model.g.dart';
part 'housing_info_model.freezed.dart';

/// Info used when adding a housing to ticket.
///
/// This is to have housing information in tickets without storing the entire information about the housing
/// and without forcing unnecessary extra-reads for every ticket document.
@freezed
class HousingInfoModel with _$HousingInfoModel {
  const HousingInfoModel._();

  @JsonSerializable(explicitToJson: true)
  const factory HousingInfoModel({
    /// The housing id.
    String? id,

    /// Number of beds available for this housing option.
    @Default(0) int? bedsAvailable,

    /// Time period for housing.
    ///
    /// 1 - short term period, 2 - long term period
    @Default(2) int? period,

    /// The full address of the housing's location.
    String? address,

    /// The user owning the housing.
    UserInfoModel? user,

    /// Aditional remarks
    String? remarks,
  }) = _HousingInfoModel;

  factory HousingInfoModel.fromJson(Map<String, dynamic> json) => _$HousingInfoModelFromJson(json);

  factory HousingInfoModel.fromHousing(HousingModel model) => HousingInfoModel(
        id: model.id!,
        bedsAvailable: model.bedsAvailable,
        period: model.period,
        address: model.address,
        user: model.user,
        remarks: model.remarks,
      );

  HousingModel get toTransport => HousingModel.fromJson(toJson()).copyWith(id: id);
}
