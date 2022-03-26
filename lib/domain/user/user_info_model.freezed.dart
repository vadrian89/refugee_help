// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) {
  return _UserInfoModel.fromJson(json);
}

/// @nodoc
class _$UserInfoModelTearOff {
  const _$UserInfoModelTearOff();

  _UserInfoModel call(
      {String? id,
      String? lastName,
      String? firstName,
      String? phone,
      ImageModel? profileImage}) {
    return _UserInfoModel(
      id: id,
      lastName: lastName,
      firstName: firstName,
      phone: phone,
      profileImage: profileImage,
    );
  }

  UserInfoModel fromJson(Map<String, Object?> json) {
    return UserInfoModel.fromJson(json);
  }
}

/// @nodoc
const $UserInfoModel = _$UserInfoModelTearOff();

/// @nodoc
mixin _$UserInfoModel {
  String? get id => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  ImageModel? get profileImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoModelCopyWith<UserInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoModelCopyWith<$Res> {
  factory $UserInfoModelCopyWith(
          UserInfoModel value, $Res Function(UserInfoModel) then) =
      _$UserInfoModelCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? lastName,
      String? firstName,
      String? phone,
      ImageModel? profileImage});

  $ImageModelCopyWith<$Res>? get profileImage;
}

/// @nodoc
class _$UserInfoModelCopyWithImpl<$Res>
    implements $UserInfoModelCopyWith<$Res> {
  _$UserInfoModelCopyWithImpl(this._value, this._then);

  final UserInfoModel _value;
  // ignore: unused_field
  final $Res Function(UserInfoModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? lastName = freezed,
    Object? firstName = freezed,
    Object? phone = freezed,
    Object? profileImage = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      profileImage: profileImage == freezed
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as ImageModel?,
    ));
  }

  @override
  $ImageModelCopyWith<$Res>? get profileImage {
    if (_value.profileImage == null) {
      return null;
    }

    return $ImageModelCopyWith<$Res>(_value.profileImage!, (value) {
      return _then(_value.copyWith(profileImage: value));
    });
  }
}

/// @nodoc
abstract class _$UserInfoModelCopyWith<$Res>
    implements $UserInfoModelCopyWith<$Res> {
  factory _$UserInfoModelCopyWith(
          _UserInfoModel value, $Res Function(_UserInfoModel) then) =
      __$UserInfoModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? lastName,
      String? firstName,
      String? phone,
      ImageModel? profileImage});

  @override
  $ImageModelCopyWith<$Res>? get profileImage;
}

/// @nodoc
class __$UserInfoModelCopyWithImpl<$Res>
    extends _$UserInfoModelCopyWithImpl<$Res>
    implements _$UserInfoModelCopyWith<$Res> {
  __$UserInfoModelCopyWithImpl(
      _UserInfoModel _value, $Res Function(_UserInfoModel) _then)
      : super(_value, (v) => _then(v as _UserInfoModel));

  @override
  _UserInfoModel get _value => super._value as _UserInfoModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? lastName = freezed,
    Object? firstName = freezed,
    Object? phone = freezed,
    Object? profileImage = freezed,
  }) {
    return _then(_UserInfoModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      profileImage: profileImage == freezed
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as ImageModel?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_UserInfoModel extends _UserInfoModel {
  const _$_UserInfoModel(
      {this.id, this.lastName, this.firstName, this.phone, this.profileImage})
      : super._();

  factory _$_UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserInfoModelFromJson(json);

  @override
  final String? id;
  @override
  final String? lastName;
  @override
  final String? firstName;
  @override
  final String? phone;
  @override
  final ImageModel? profileImage;

  @override
  String toString() {
    return 'UserInfoModel(id: $id, lastName: $lastName, firstName: $firstName, phone: $phone, profileImage: $profileImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserInfoModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality()
                .equals(other.profileImage, profileImage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(profileImage));

  @JsonKey(ignore: true)
  @override
  _$UserInfoModelCopyWith<_UserInfoModel> get copyWith =>
      __$UserInfoModelCopyWithImpl<_UserInfoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserInfoModelToJson(this);
  }
}

abstract class _UserInfoModel extends UserInfoModel {
  const factory _UserInfoModel(
      {String? id,
      String? lastName,
      String? firstName,
      String? phone,
      ImageModel? profileImage}) = _$_UserInfoModel;
  const _UserInfoModel._() : super._();

  factory _UserInfoModel.fromJson(Map<String, dynamic> json) =
      _$_UserInfoModel.fromJson;

  @override
  String? get id;
  @override
  String? get lastName;
  @override
  String? get firstName;
  @override
  String? get phone;
  @override
  ImageModel? get profileImage;
  @override
  @JsonKey(ignore: true)
  _$UserInfoModelCopyWith<_UserInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
