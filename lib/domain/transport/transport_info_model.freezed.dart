// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transport_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransportInfoModel _$TransportInfoModelFromJson(Map<String, dynamic> json) {
  return _TransportInfoModel.fromJson(json);
}

/// @nodoc
class _$TransportInfoModelTearOff {
  const _$TransportInfoModelTearOff();

  _TransportInfoModel call(
      {required String id,
      String? registrationNumber,
      int? seatsAvailable = 0,
      TransportTypeModel? type,
      String? destinations,
      UserInfoModel? user,
      String? remarks}) {
    return _TransportInfoModel(
      id: id,
      registrationNumber: registrationNumber,
      seatsAvailable: seatsAvailable,
      type: type,
      destinations: destinations,
      user: user,
      remarks: remarks,
    );
  }

  TransportInfoModel fromJson(Map<String, Object?> json) {
    return TransportInfoModel.fromJson(json);
  }
}

/// @nodoc
const $TransportInfoModel = _$TransportInfoModelTearOff();

/// @nodoc
mixin _$TransportInfoModel {
  String get id => throw _privateConstructorUsedError;
  String? get registrationNumber => throw _privateConstructorUsedError;
  int? get seatsAvailable => throw _privateConstructorUsedError;
  TransportTypeModel? get type => throw _privateConstructorUsedError;
  String? get destinations => throw _privateConstructorUsedError;
  UserInfoModel? get user => throw _privateConstructorUsedError;
  String? get remarks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransportInfoModelCopyWith<TransportInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransportInfoModelCopyWith<$Res> {
  factory $TransportInfoModelCopyWith(
          TransportInfoModel value, $Res Function(TransportInfoModel) then) =
      _$TransportInfoModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String? registrationNumber,
      int? seatsAvailable,
      TransportTypeModel? type,
      String? destinations,
      UserInfoModel? user,
      String? remarks});

  $UserInfoModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$TransportInfoModelCopyWithImpl<$Res>
    implements $TransportInfoModelCopyWith<$Res> {
  _$TransportInfoModelCopyWithImpl(this._value, this._then);

  final TransportInfoModel _value;
  // ignore: unused_field
  final $Res Function(TransportInfoModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? registrationNumber = freezed,
    Object? seatsAvailable = freezed,
    Object? type = freezed,
    Object? destinations = freezed,
    Object? user = freezed,
    Object? remarks = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      registrationNumber: registrationNumber == freezed
          ? _value.registrationNumber
          : registrationNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      seatsAvailable: seatsAvailable == freezed
          ? _value.seatsAvailable
          : seatsAvailable // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransportTypeModel?,
      destinations: destinations == freezed
          ? _value.destinations
          : destinations // ignore: cast_nullable_to_non_nullable
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
abstract class _$TransportInfoModelCopyWith<$Res>
    implements $TransportInfoModelCopyWith<$Res> {
  factory _$TransportInfoModelCopyWith(
          _TransportInfoModel value, $Res Function(_TransportInfoModel) then) =
      __$TransportInfoModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String? registrationNumber,
      int? seatsAvailable,
      TransportTypeModel? type,
      String? destinations,
      UserInfoModel? user,
      String? remarks});

  @override
  $UserInfoModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$TransportInfoModelCopyWithImpl<$Res>
    extends _$TransportInfoModelCopyWithImpl<$Res>
    implements _$TransportInfoModelCopyWith<$Res> {
  __$TransportInfoModelCopyWithImpl(
      _TransportInfoModel _value, $Res Function(_TransportInfoModel) _then)
      : super(_value, (v) => _then(v as _TransportInfoModel));

  @override
  _TransportInfoModel get _value => super._value as _TransportInfoModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? registrationNumber = freezed,
    Object? seatsAvailable = freezed,
    Object? type = freezed,
    Object? destinations = freezed,
    Object? user = freezed,
    Object? remarks = freezed,
  }) {
    return _then(_TransportInfoModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      registrationNumber: registrationNumber == freezed
          ? _value.registrationNumber
          : registrationNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      seatsAvailable: seatsAvailable == freezed
          ? _value.seatsAvailable
          : seatsAvailable // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransportTypeModel?,
      destinations: destinations == freezed
          ? _value.destinations
          : destinations // ignore: cast_nullable_to_non_nullable
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
class _$_TransportInfoModel extends _TransportInfoModel {
  const _$_TransportInfoModel(
      {required this.id,
      this.registrationNumber,
      this.seatsAvailable = 0,
      this.type,
      this.destinations,
      this.user,
      this.remarks})
      : super._();

  factory _$_TransportInfoModel.fromJson(Map<String, dynamic> json) =>
      _$$_TransportInfoModelFromJson(json);

  @override
  final String id;
  @override
  final String? registrationNumber;
  @JsonKey()
  @override
  final int? seatsAvailable;
  @override
  final TransportTypeModel? type;
  @override
  final String? destinations;
  @override
  final UserInfoModel? user;
  @override
  final String? remarks;

  @override
  String toString() {
    return 'TransportInfoModel(id: $id, registrationNumber: $registrationNumber, seatsAvailable: $seatsAvailable, type: $type, destinations: $destinations, user: $user, remarks: $remarks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TransportInfoModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.registrationNumber, registrationNumber) &&
            const DeepCollectionEquality()
                .equals(other.seatsAvailable, seatsAvailable) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality()
                .equals(other.destinations, destinations) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.remarks, remarks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(registrationNumber),
      const DeepCollectionEquality().hash(seatsAvailable),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(destinations),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(remarks));

  @JsonKey(ignore: true)
  @override
  _$TransportInfoModelCopyWith<_TransportInfoModel> get copyWith =>
      __$TransportInfoModelCopyWithImpl<_TransportInfoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransportInfoModelToJson(this);
  }
}

abstract class _TransportInfoModel extends TransportInfoModel {
  const factory _TransportInfoModel(
      {required String id,
      String? registrationNumber,
      int? seatsAvailable,
      TransportTypeModel? type,
      String? destinations,
      UserInfoModel? user,
      String? remarks}) = _$_TransportInfoModel;
  const _TransportInfoModel._() : super._();

  factory _TransportInfoModel.fromJson(Map<String, dynamic> json) =
      _$_TransportInfoModel.fromJson;

  @override
  String get id;
  @override
  String? get registrationNumber;
  @override
  int? get seatsAvailable;
  @override
  TransportTypeModel? get type;
  @override
  String? get destinations;
  @override
  UserInfoModel? get user;
  @override
  String? get remarks;
  @override
  @JsonKey(ignore: true)
  _$TransportInfoModelCopyWith<_TransportInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
