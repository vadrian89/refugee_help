// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/domain/core/image_model.dart';
import 'package:refugee_help/domain/user/user_info_model.dart';
import 'package:refugee_help/domain/util/json_util.dart';

import 'transport_type_model.dart';

part 'transport_model.g.dart';
part 'transport_model.freezed.dart';

@freezed
class TransportModel with _$TransportModel {
  String get storagePath => "${user!.id}/transport";
  String get imageStoragePath => "$storagePath/$id/image.${image!.fileExtension}";
  bool get regNumberIsValid => registrationNumber?.isNotEmpty ?? false;
  bool get seatsAvailableIsValid => (seatsAvailable ?? 0) > 0;
  bool get typeIsValid => type != null;
  bool get imageIsValid => image != null;
  bool get timeAvailableIsValid => atLocation! || (timeAvailable ?? 0) > 0;
  bool get destinationsIsValid => destinations?.isNotEmpty ?? false;

  const TransportModel._();

  @JsonSerializable(explicitToJson: true)
  const factory TransportModel({
    @JsonKey(ignore: true) String? id,
    @JsonKey(name: "registration_number") String? registrationNumber,
    @Default(0) @JsonKey(name: "seats_available") int? seatsAvailable,
    @JsonKey(name: "transport_type") TransportTypeModel? type,
    ImageModel? image,
    @Default(true) @JsonKey(name: "at_location") bool? atLocation,

    /// Time, in minutes, until the volunteer can get at site ([from]).
    ///
    /// If this is, he is already at the site.
    @Default(0) @JsonKey(name: "time_available") int? timeAvailable,
    @JsonKey(name: "is_available") @Default(false) bool? isAvailable,

    /// The location from where he can pick the refugees.
    ///
    /// Currently Isaccea-Tulcea is the only available location.
    @Default("Isaccea-Tulcea") String? from,
    String? destinations,
    UserInfoModel? user,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson, name: "updated_at")
        DateTime? createdAt,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson, name: "created_at")
        DateTime? updatedAt,
    String? remarks,
  }) = _TransportModel;

  factory TransportModel.fromJson(Map<String, dynamic> json) => _$TransportModelFromJson(json);

  Map<String, dynamic> get availabilityJson => {
        "is_available": isAvailable,
        "updated_at": dateTimeToJson(updatedAt),
      };
}
