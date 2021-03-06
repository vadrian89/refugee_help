// ignore_for_file: invalid_annotation_target

import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/domain/core/image_model.dart';
import 'package:refugee_help/domain/housing/housing_type_model.dart';
import 'package:refugee_help/domain/user/user_info_model.dart';
import 'package:refugee_help/domain/util/json_util.dart';

part 'housing_model.g.dart';
part 'housing_model.freezed.dart';

/// Housing related information model class.
@freezed
class HousingModel with _$HousingModel {
  /// Directory where image for this housing should be stored.
  String get storagePath => "${user!.id}/housing/$id";

  /// If image list is not empty.
  bool get imageListIsValid => imageList?.isNotEmpty ?? false;

  /// If the address is set.
  bool get addressIsValid => address?.isNotEmpty ?? false;

  /// Images which are stored in the cloud.
  List<ImageModel> get cloudImages => imageList?.where((e) => !e.isLocal).toList() ?? [];

  /// Images which are local.
  List<ImageModel> get localImages => imageList?.where((e) => e.isLocal).toList() ?? [];

  /// If the housing has local images which should be uploaded.
  bool get hasLocalImages => localImages.isNotEmpty;

  /// If there are images which should be deleted from the cloud.
  bool get hasImagesToDelete => imagesToDelete?.isNotEmpty ?? false;

  /// The period as translated string
  String get periodStr => (period == 2) ? "long_period".tr() : "short_period".tr();

  const HousingModel._();

  @JsonSerializable(explicitToJson: true)
  const factory HousingModel({
    /// The housing id.
    String? id,

    /// Number of beds available for this housing option.
    @Default(0) int? bedsAvailable,

    /// Time period for housing.
    ///
    /// 1 - short term period, 2 - long term period
    @Default(2) int? period,

    /// Images of the housing.
    List<ImageModel>? imageList,

    /// Images which should be deleted.
    @JsonKey(ignore: true) List<ImageModel>? imagesToDelete,

    /// If is available.
    @Default(true) bool? isAvailable,

    /// If the owner ofers transport to the housing.
    @Default(true) bool? hasTransport,

    /// The country of the housing's location.
    @Default("Romania") String? country,

    /// The search index for the [country].
    String? countryIndex,

    /// The county of the housing's location.
    String? county,

    /// The search index for the [county].
    String? countyIndex,

    /// The city of the housing's location.
    String? city,

    /// The search index for the [city].
    String? cityIndex,

    /// The address of the housing's location.
    String? address,

    /// The index of the [address].
    String? addressIndex,

    /// The user owning the housing.
    UserInfoModel? user,

    /// Housing type
    HousingTypeModel? type,

    /// Creation date.
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime? createdAt,

    /// When was the entry last updated.
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime? updatedAt,

    /// Aditional remarks
    String? remarks,

    /// For development purposes.
    @Default(false) bool? isMock,
  }) = _HousingModel;

  factory HousingModel.fromJson(Map<String, dynamic> json) => _$HousingModelFromJson(json);

  HousingModel get updatedIndexes => copyWith(
        countryIndex: country?.toLowerCase(),
        countyIndex: county?.toLowerCase(),
        cityIndex: city?.toLowerCase(),
        addressIndex: address?.toLowerCase(),
      ).updated;

  HousingModel get updated => copyWith(
        createdAt: createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
      );

  Map<String, dynamic> get availabilityJson => {
        "isAvailable": isAvailable,
        "updatedAt": dateTimeToJson(updatedAt),
      };
}
