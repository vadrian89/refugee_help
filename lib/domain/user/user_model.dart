// ignore_for_file: invalid_annotation_target

import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/domain/core/image_model.dart';
import 'package:refugee_help/domain/util/json_util.dart';
import 'package:refugee_help/infrastructure/validators.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'user_category_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// Model of the user's profile stored in the database.
///
/// Contains all fields, mapped to their respective table columns.
@freezed
class UserModel with _$UserModel {
  String get imageStoragePath => "$id/profile_image.${profileImage!.fileExtension}";

  /// Get the full name of the user by making use of string interpolation.
  String get fullName => "${lastName ?? ""} ${firstName ?? ""}";
  bool get isPrivileged => category!.privileged;
  bool get emailIsValid => Validators.isValidEmail(email);
  bool get lastNameIsValid => lastName?.isNotEmpty ?? false;
  bool get firstNameIsValid => firstName?.isNotEmpty ?? false;
  bool get phoneIsValid => Validators.isValidPhone(phone);
  bool get countyIsValid => county?.isNotEmpty ?? false;
  bool get cityIsValid => city?.isNotEmpty ?? false;
  bool get addressIsValid => address?.isNotEmpty ?? false;
  bool get imageIsValid => profileImage?.isValid ?? false;
  bool get isValid =>
      emailIsValid &&
      lastNameIsValid &&
      firstNameIsValid &&
      phoneIsValid &&
      countyIsValid &&
      cityIsValid &&
      addressIsValid &&
      imageIsValid;

  /// Make the constructor private to enable custom computed values (getters) and methods.
  ///
  /// You can read more, here: https://pub.dev/packages/freezed#custom-getters-and-methods
  const UserModel._();

  @JsonSerializable(explicitToJson: true)
  const factory UserModel({
    String? id,
    @JsonKey(fromJson: UserCategoryModel.fromJson, toJson: UserCategoryModel.toJson)
        UserCategoryModel? category,
    String? email,
    String? lastName,
    String? firstName,
    String? phone,
    String? county,
    String? city,
    String? address,
    ImageModel? profileImage,
    String? organization,
    @Default(false) bool? isAvailable,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime? createdAt,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime? updatedAt,
    @JsonKey(ignore: true) String? password,
    @JsonKey(ignore: true) @Default(false) bool isAnonymous,
    @JsonKey(ignore: true) @Default(false) bool emailVerified,
  }) = _UserModel;

  /// Make a [UserModel] object from the incoming JSON.
  factory UserModel.fromJson(Map<String, dynamic> data) => _$UserModelFromJson(data);

  factory UserModel.fromAuth(User user) => UserModel(
        id: user.uid,
        profileImage: ImageModel(imageURL: user.photoURL),
        lastName: (user.displayName?.trim().isNotEmpty ?? false)
            ? user.displayName!.split(" ").last
            : null,
        firstName: (user.displayName?.trim().isNotEmpty ?? false)
            ? user.displayName!.split(" ").first
            : null,
        email: user.email,
        emailVerified: user.emailVerified,
        phone: user.phoneNumber,
        createdAt: user.metadata.creationTime,
        updatedAt: user.metadata.lastSignInTime,
        isAnonymous: user.isAnonymous,
        category: UserCategoryModel.volunteer(),
      );

  factory UserModel.fromApple(User user, AuthorizationCredentialAppleID appleUser) => UserModel(
        id: user.uid,
        profileImage: ImageModel(imageURL: user.photoURL),
        lastName: appleUser.familyName,
        firstName: appleUser.givenName,
        email: user.email,
        emailVerified: user.emailVerified,
        phone: user.phoneNumber,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        category: UserCategoryModel.volunteer(),
      );

  Map<String, dynamic> get availabilityJson => {
        "isAvailable": isAvailable,
        "updatedAt": dateTimeToJson(updatedAt),
      };
}
