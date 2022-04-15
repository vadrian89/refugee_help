// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'housing_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HousingInfoModel _$HousingInfoModelFromJson(Map<String, dynamic> json) {
  return _HousingInfoModel.fromJson(json);
}

/// @nodoc
class _$HousingInfoModelTearOff {
  const _$HousingInfoModelTearOff();

  _HousingInfoModel call(
      {String? id,
      int? bedsAvailable = 0,
      int? period = 2,
      String? address,
      UserInfoModel? user,
      String? remarks}) {
    return _HousingInfoModel(
      id: id,
      bedsAvailable: bedsAvailable,
      period: period,
      address: address,
      user: user,
      remarks: remarks,
    );
  }

  HousingInfoModel fromJson(Map<String, Object?> json) {
    return HousingInfoModel.fromJson(json);
  }
}

/// @nodoc
const $HousingInfoModel = _$HousingInfoModelTearOff();

/// @nodoc
mixin _$HousingInfoModel {
  /// The housing id.
  String? get id => throw _privateConstructorUsedError;

  /// Number of beds available for this housing option.
  int? get bedsAvailable => throw _privateConstructorUsedError;

  /// Time period for housing.
  ///
  /// 1 - short term period, 2 - long term period
  int? get period => throw _privateConstructorUsedError;

  /// The full address of the housing's location.
  String? get address => throw _privateConstructorUsedError;

  /// The user owning the housing.
  UserInfoModel? get user => throw _privateConstructorUsedError;

  /// Aditional remarks
  String? get remarks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HousingInfoModelCopyWith<HousingInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HousingInfoModelCopyWith<$Res> {
  factory $HousingInfoModelCopyWith(
          HousingInfoModel value, $Res Function(HousingInfoModel) then) =
      _$HousingInfoModelCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      int? bedsAvailable,
      int? period,
      String? address,
      UserInfoModel? user,
      String? remarks});

  $UserInfoModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$HousingInfoModelCopyWithImpl<$Res>
    implements $HousingInfoModelCopyWith<$Res> {
  _$HousingInfoModelCopyWithImpl(this._value, this._then);

  final HousingInfoModel _value;
  // ignore: unused_field
  final $Res Function(HousingInfoModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? bedsAvailable = freezed,
    Object? period = freezed,
    Object? address = freezed,
    Object? user = freezed,
    Object? remarks = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      bedsAvailable: bedsAvailable == freezed
          ? _value.bedsAvailable
          : bedsAvailable // ignore: cast_nullable_to_non_nullable
              as int?,
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserInfoModel?,
      remarks: remarks == freezed
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $UserInfoModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserInfoModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$HousingInfoModelCopyWith<$Res>
    implements $HousingInfoModelCopyWith<$Res> {
  factory _$HousingInfoModelCopyWith(
          _HousingInfoModel value, $Res Function(_HousingInfoModel) then) =
      __$HousingInfoModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      int? bedsAvailable,
      int? period,
      String? address,
      UserInfoModel? user,
      String? remarks});

  @override
  $UserInfoModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$HousingInfoModelCopyWithImpl<$Res>
    extends _$HousingInfoModelCopyWithImpl<$Res>
    implements _$HousingInfoModelCopyWith<$Res> {
  __$HousingInfoModelCopyWithImpl(
      _HousingInfoModel _value, $Res Function(_HousingInfoModel) _then)
      : super(_value, (v) => _then(v as _HousingInfoModel));

  @override
  _HousingInfoModel get _value => super._value as _HousingInfoModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? bedsAvailable = freezed,
    Object? period = freezed,
    Object? address = freezed,
    Object? user = freezed,
    Object? remarks = freezed,
  }) {
    return _then(_HousingInfoModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      bedsAvailable: bedsAvailable == freezed
          ? _value.bedsAvailable
          : bedsAvailable // ignore: cast_nullable_to_non_nullable
              as int?,
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserInfoModel?,
      remarks: remarks == freezed
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_HousingInfoModel extends _HousingInfoModel {
  const _$_HousingInfoModel(
      {this.id,
      this.bedsAvailable = 0,
      this.period = 2,
      this.address,
      this.user,
      this.remarks})
      : super._();

  factory _$_HousingInfoModel.fromJson(Map<String, dynamic> json) =>
      _$$_HousingInfoModelFromJson(json);

  @override

  /// The housing id.
  final String? id;
  @JsonKey()
  @override

  /// Number of beds available for this housing option.
  final int? bedsAvailable;
  @JsonKey()
  @override

  /// Time period for housing.
  ///
  /// 1 - short term period, 2 - long term period
  final int? period;
  @override

  /// The full address of the housing's location.
  final String? address;
  @override

  /// The user owning the housing.
  final UserInfoModel? user;
  @override

  /// Aditional remarks
  final String? remarks;

  @override
  String toString() {
    return 'HousingInfoModel(id: $id, bedsAvailable: $bedsAvailable, period: $period, address: $address, user: $user, remarks: $remarks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HousingInfoModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.bedsAvailable, bedsAvailable) &&
            const DeepCollectionEquality().equals(other.period, period) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.remarks, remarks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(bedsAvailable),
      const DeepCollectionEquality().hash(period),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(remarks));

  @JsonKey(ignore: true)
  @override
  _$HousingInfoModelCopyWith<_HousingInfoModel> get copyWith =>
      __$HousingInfoModelCopyWithImpl<_HousingInfoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HousingInfoModelToJson(this);
  }
}

abstract class _HousingInfoModel extends HousingInfoModel {
  const factory _HousingInfoModel(
      {String? id,
      int? bedsAvailable,
      int? period,
      String? address,
      UserInfoModel? user,
      String? remarks}) = _$_HousingInfoModel;
  const _HousingInfoModel._() : super._();

  factory _HousingInfoModel.fromJson(Map<String, dynamic> json) =
      _$_HousingInfoModel.fromJson;

  @override

  /// The housing id.
  String? get id;
  @override

  /// Number of beds available for this housing option.
  int? get bedsAvailable;
  @override

  /// Time period for housing.
  ///
  /// 1 - short term period, 2 - long term period
  int? get period;
  @override

  /// The full address of the housing's location.
  String? get address;
  @override

  /// The user owning the housing.
  UserInfoModel? get user;
  @override

  /// Aditional remarks
  String? get remarks;
  @override
  @JsonKey(ignore: true)
  _$HousingInfoModelCopyWith<_HousingInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
