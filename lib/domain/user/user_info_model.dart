// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/domain/core/image_model.dart';
import 'package:refugee_help/domain/user/user_model.dart';

part 'user_info_model.freezed.dart';
part 'user_info_model.g.dart';

/// Model of the user's info used inside other firebase documents (such as: transport, housing, ticket, etc.).
@freezed
class UserInfoModel with _$UserInfoModel {
  const UserInfoModel._();

  String get fullName => "$lastName $firstName";
  @JsonSerializable(explicitToJson: true)
  const factory UserInfoModel({
    required String id,
    @JsonKey(name: "last_name") required String lastName,
    @JsonKey(name: "first_name") required String firstName,
    required String phone,
    @JsonKey(name: "profile_image") required ImageModel profileImage,
  }) = _UserInfoModel;

  /// Make a [UserInfoModel] object from the incoming JSON.
  factory UserInfoModel.fromJson(Map<String, dynamic> data) => _$UserInfoModelFromJson(data);

  factory UserInfoModel.fromUser(UserModel user) => UserInfoModel.fromJson(user.toJson());
}
