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
    String? id,
    String? registrationNumber,
    @Default(0) int? seatsAvailable,
    TransportTypeModel? type,
    ImageModel? image,
    @Default(true) bool? atLocation,

    /// Time, in minutes, until the volunteer can get at site ([from]).
    ///
    /// If this is, he is already at the site.
    @Default(0) int? timeAvailable,
    @Default(false) bool? isAvailable,
    String? destinations,
    UserInfoModel? user,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime? createdAt,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime? updatedAt,
    String? remarks,

    /// For development purposes.
    @Default(false) bool? isMock,
  }) = _TransportModel;

  factory TransportModel.fromJson(Map<String, dynamic> json) => _$TransportModelFromJson(json);

  Map<String, dynamic> get availabilityJson => {
        "isAvailable": isAvailable,
        "updatedAt": dateTimeToJson(updatedAt),
      };
}
