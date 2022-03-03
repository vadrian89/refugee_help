// ignore_for_file: invalid_annotation_target

import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/domain/util/json_util.dart';
import 'package:refugee_help/infrastructure/validators.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'user_category_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// Model of the user's profile stored in the database.
///
/// Contains all fields, mapped to their respective table columns.
/// Because SQL and Dart naming convention differs, we make use `@JsonKey(name: "")` to properly map
/// the fields.
@freezed
class UserModel with _$UserModel {
  /// Make the constructor private to enable custom computed values (getters) and methods.
  ///
  /// You can read more, here: https://pub.dev/packages/freezed#custom-getters-and-methods
  const UserModel._();

  /// Get the full name of the user by making use of string interpolation.
  String get fullName => "${lastName ?? ""} ${firstName ?? ""}";

  bool get emailIsValid => Validators.isValidEmail(email);
  bool get lastNameIsValid => lastName?.isNotEmpty ?? false;
  bool get firstNameIsValid => firstName?.isNotEmpty ?? false;
  bool get phoneIsValid => phone?.isNotEmpty ?? false;
  bool get isValid => emailIsValid && lastNameIsValid && firstNameIsValid && phoneIsValid;

  const factory UserModel({
    String? id,
    @JsonKey(fromJson: UserCategoryModel.fromJson, toJson: UserCategoryModel.toJson)
        UserCategoryModel? category,
    String? email,
    @JsonKey(ignore: true) String? password,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "first_name") String? firstName,
    String? phone,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson, name: "updated_at")
        DateTime? createdAt,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson, name: "created_at")
        DateTime? updatedAt,
    @JsonKey(ignore: true) @Default(false) isAnonymous,
    @JsonKey(ignore: true) @Default(false) emailVerified,
  }) = _UserModel;

  /// Make a [UserModel] object from the incoming JSON.
  factory UserModel.fromJson(Map<String, dynamic> data) => _$UserModelFromJson(data);

  factory UserModel.fromAuth(User user) => UserModel(
        id: user.uid,
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
        category: userCategList.firstWhere((e) => e.name == "Volunteer"),
      );

  factory UserModel.fromApple(User user, AuthorizationCredentialAppleID appleUser) => UserModel(
        id: user.uid,
        lastName: appleUser.familyName,
        firstName: appleUser.givenName,
        email: user.email,
        emailVerified: user.emailVerified,
        phone: user.phoneNumber,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        category: userCategList.firstWhere((e) => e.name == "Volunteer"),
      );
}
