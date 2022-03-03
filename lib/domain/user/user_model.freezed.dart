// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
class _$UserModelTearOff {
  const _$UserModelTearOff();

  _UserModel call(
      {String? id,
      @JsonKey(fromJson: UserCategoryModel.fromJson, toJson: UserCategoryModel.toJson)
          UserCategoryModel? category,
      String? email,
      @JsonKey(ignore: true)
          String? password,
      @JsonKey(name: "last_name")
          String? lastName,
      @JsonKey(name: "first_name")
          String? firstName,
      String? phone,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson, name: "updated_at")
          DateTime? createdAt,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson, name: "created_at")
          DateTime? updatedAt,
      @JsonKey(ignore: true)
          dynamic isAnonymous = false,
      @JsonKey(ignore: true)
          dynamic emailVerified = false}) {
    return _UserModel(
      id: id,
      category: category,
      email: email,
      password: password,
      lastName: lastName,
      firstName: firstName,
      phone: phone,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isAnonymous: isAnonymous,
      emailVerified: emailVerified,
    );
  }

  UserModel fromJson(Map<String, Object?> json) {
    return UserModel.fromJson(json);
  }
}

/// @nodoc
const $UserModel = _$UserModelTearOff();

/// @nodoc
mixin _$UserModel {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: UserCategoryModel.fromJson, toJson: UserCategoryModel.toJson)
  UserCategoryModel? get category => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: "first_name")
  String? get firstName => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: dateTimeFromJson, toJson: dateTimeToJson, name: "updated_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: dateTimeFromJson, toJson: dateTimeToJson, name: "created_at")
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  dynamic get isAnonymous => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  dynamic get emailVerified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      @JsonKey(fromJson: UserCategoryModel.fromJson, toJson: UserCategoryModel.toJson)
          UserCategoryModel? category,
      String? email,
      @JsonKey(ignore: true)
          String? password,
      @JsonKey(name: "last_name")
          String? lastName,
      @JsonKey(name: "first_name")
          String? firstName,
      String? phone,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson, name: "updated_at")
          DateTime? createdAt,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson, name: "created_at")
          DateTime? updatedAt,
      @JsonKey(ignore: true)
          dynamic isAnonymous,
      @JsonKey(ignore: true)
          dynamic emailVerified});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  final UserModel _value;
  // ignore: unused_field
  final $Res Function(UserModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? category = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? lastName = freezed,
    Object? firstName = freezed,
    Object? phone = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isAnonymous = freezed,
    Object? emailVerified = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as UserCategoryModel?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isAnonymous: isAnonymous == freezed
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as dynamic,
      emailVerified: emailVerified == freezed
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) then) =
      __$UserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      @JsonKey(fromJson: UserCategoryModel.fromJson, toJson: UserCategoryModel.toJson)
          UserCategoryModel? category,
      String? email,
      @JsonKey(ignore: true)
          String? password,
      @JsonKey(name: "last_name")
          String? lastName,
      @JsonKey(name: "first_name")
          String? firstName,
      String? phone,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson, name: "updated_at")
          DateTime? createdAt,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson, name: "created_at")
          DateTime? updatedAt,
      @JsonKey(ignore: true)
          dynamic isAnonymous,
      @JsonKey(ignore: true)
          dynamic emailVerified});
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> extends _$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(_UserModel _value, $Res Function(_UserModel) _then)
      : super(_value, (v) => _then(v as _UserModel));

  @override
  _UserModel get _value => super._value as _UserModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? category = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? lastName = freezed,
    Object? firstName = freezed,
    Object? phone = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isAnonymous = freezed,
    Object? emailVerified = freezed,
  }) {
    return _then(_UserModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as UserCategoryModel?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isAnonymous: isAnonymous == freezed ? _value.isAnonymous : isAnonymous,
      emailVerified:
          emailVerified == freezed ? _value.emailVerified : emailVerified,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel extends _UserModel {
  const _$_UserModel(
      {this.id,
      @JsonKey(fromJson: UserCategoryModel.fromJson, toJson: UserCategoryModel.toJson)
          this.category,
      this.email,
      @JsonKey(ignore: true)
          this.password,
      @JsonKey(name: "last_name")
          this.lastName,
      @JsonKey(name: "first_name")
          this.firstName,
      this.phone,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson, name: "updated_at")
          this.createdAt,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson, name: "created_at")
          this.updatedAt,
      @JsonKey(ignore: true)
          this.isAnonymous = false,
      @JsonKey(ignore: true)
          this.emailVerified = false})
      : super._();

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(
      fromJson: UserCategoryModel.fromJson, toJson: UserCategoryModel.toJson)
  final UserCategoryModel? category;
  @override
  final String? email;
  @override
  @JsonKey(ignore: true)
  final String? password;
  @override
  @JsonKey(name: "last_name")
  final String? lastName;
  @override
  @JsonKey(name: "first_name")
  final String? firstName;
  @override
  final String? phone;
  @override
  @JsonKey(
      fromJson: dateTimeFromJson, toJson: dateTimeToJson, name: "updated_at")
  final DateTime? createdAt;
  @override
  @JsonKey(
      fromJson: dateTimeFromJson, toJson: dateTimeToJson, name: "created_at")
  final DateTime? updatedAt;
  @override
  @JsonKey(ignore: true)
  final dynamic isAnonymous;
  @override
  @JsonKey(ignore: true)
  final dynamic emailVerified;

  @override
  String toString() {
    return 'UserModel(id: $id, category: $category, email: $email, password: $password, lastName: $lastName, firstName: $firstName, phone: $phone, createdAt: $createdAt, updatedAt: $updatedAt, isAnonymous: $isAnonymous, emailVerified: $emailVerified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality()
                .equals(other.isAnonymous, isAnonymous) &&
            const DeepCollectionEquality()
                .equals(other.emailVerified, emailVerified));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(isAnonymous),
      const DeepCollectionEquality().hash(emailVerified));

  @JsonKey(ignore: true)
  @override
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(this);
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel(
      {String? id,
      @JsonKey(fromJson: UserCategoryModel.fromJson, toJson: UserCategoryModel.toJson)
          UserCategoryModel? category,
      String? email,
      @JsonKey(ignore: true)
          String? password,
      @JsonKey(name: "last_name")
          String? lastName,
      @JsonKey(name: "first_name")
          String? firstName,
      String? phone,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson, name: "updated_at")
          DateTime? createdAt,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson, name: "created_at")
          DateTime? updatedAt,
      @JsonKey(ignore: true)
          dynamic isAnonymous,
      @JsonKey(ignore: true)
          dynamic emailVerified}) = _$_UserModel;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(
      fromJson: UserCategoryModel.fromJson, toJson: UserCategoryModel.toJson)
  UserCategoryModel? get category;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  String? get password;
  @override
  @JsonKey(name: "last_name")
  String? get lastName;
  @override
  @JsonKey(name: "first_name")
  String? get firstName;
  @override
  String? get phone;
  @override
  @JsonKey(
      fromJson: dateTimeFromJson, toJson: dateTimeToJson, name: "updated_at")
  DateTime? get createdAt;
  @override
  @JsonKey(
      fromJson: dateTimeFromJson, toJson: dateTimeToJson, name: "created_at")
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  dynamic get isAnonymous;
  @override
  @JsonKey(ignore: true)
  dynamic get emailVerified;
  @override
  @JsonKey(ignore: true)
  _$UserModelCopyWith<_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}