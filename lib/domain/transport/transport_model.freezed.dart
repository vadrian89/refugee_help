// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transport_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransportModel _$TransportModelFromJson(Map<String, dynamic> json) {
  return _TransportModel.fromJson(json);
}

/// @nodoc
class _$TransportModelTearOff {
  const _$TransportModelTearOff();

  _TransportModel call(
      {String? id,
      String? registrationNumber,
      int? seatsAvailable = 0,
      TransportTypeModel? type,
      ImageModel? image,
      bool? atLocation = true,
      int? timeAvailable = 0,
      bool? isAvailable = false,
      String? destinations,
      List<String>? destinationsIndex,
      UserInfoModel? user,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? createdAt,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? updatedAt,
      String? remarks,
      bool? isMock = false}) {
    return _TransportModel(
      id: id,
      registrationNumber: registrationNumber,
      seatsAvailable: seatsAvailable,
      type: type,
      image: image,
      atLocation: atLocation,
      timeAvailable: timeAvailable,
      isAvailable: isAvailable,
      destinations: destinations,
      destinationsIndex: destinationsIndex,
      user: user,
      createdAt: createdAt,
      updatedAt: updatedAt,
      remarks: remarks,
      isMock: isMock,
    );
  }

  TransportModel fromJson(Map<String, Object?> json) {
    return TransportModel.fromJson(json);
  }
}

/// @nodoc
const $TransportModel = _$TransportModelTearOff();

/// @nodoc
mixin _$TransportModel {
  String? get id => throw _privateConstructorUsedError;
  String? get registrationNumber => throw _privateConstructorUsedError;
  int? get seatsAvailable => throw _privateConstructorUsedError;
  TransportTypeModel? get type => throw _privateConstructorUsedError;
  ImageModel? get image => throw _privateConstructorUsedError;
  bool? get atLocation => throw _privateConstructorUsedError;

  /// Time, in minutes, until the volunteer can get at site ([from]).
  ///
  /// If this is, he is already at the site.
  int? get timeAvailable => throw _privateConstructorUsedError;
  bool? get isAvailable => throw _privateConstructorUsedError;
  String? get destinations => throw _privateConstructorUsedError;
  List<String>? get destinationsIndex => throw _privateConstructorUsedError;
  UserInfoModel? get user => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get remarks => throw _privateConstructorUsedError;

  /// For development purposes.
  bool? get isMock => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransportModelCopyWith<TransportModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransportModelCopyWith<$Res> {
  factory $TransportModelCopyWith(
          TransportModel value, $Res Function(TransportModel) then) =
      _$TransportModelCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? registrationNumber,
      int? seatsAvailable,
      TransportTypeModel? type,
      ImageModel? image,
      bool? atLocation,
      int? timeAvailable,
      bool? isAvailable,
      String? destinations,
      List<String>? destinationsIndex,
      UserInfoModel? user,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? createdAt,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? updatedAt,
      String? remarks,
      bool? isMock});

  $ImageModelCopyWith<$Res>? get image;
  $UserInfoModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$TransportModelCopyWithImpl<$Res>
    implements $TransportModelCopyWith<$Res> {
  _$TransportModelCopyWithImpl(this._value, this._then);

  final TransportModel _value;
  // ignore: unused_field
  final $Res Function(TransportModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? registrationNumber = freezed,
    Object? seatsAvailable = freezed,
    Object? type = freezed,
    Object? image = freezed,
    Object? atLocation = freezed,
    Object? timeAvailable = freezed,
    Object? isAvailable = freezed,
    Object? destinations = freezed,
    Object? destinationsIndex = freezed,
    Object? user = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? remarks = freezed,
    Object? isMock = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageModel?,
      atLocation: atLocation == freezed
          ? _value.atLocation
          : atLocation // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeAvailable: timeAvailable == freezed
          ? _value.timeAvailable
          : timeAvailable // ignore: cast_nullable_to_non_nullable
              as int?,
      isAvailable: isAvailable == freezed
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      destinations: destinations == freezed
          ? _value.destinations
          : destinations // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationsIndex: destinationsIndex == freezed
          ? _value.destinationsIndex
          : destinationsIndex // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserInfoModel?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      remarks: remarks == freezed
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      isMock: isMock == freezed
          ? _value.isMock
          : isMock // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $ImageModelCopyWith<$Res>? get image {
    if (_value.image == null) {
      return null;
    }

    return $ImageModelCopyWith<$Res>(_value.image!, (value) {
      return _then(_value.copyWith(image: value));
    });
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
abstract class _$TransportModelCopyWith<$Res>
    implements $TransportModelCopyWith<$Res> {
  factory _$TransportModelCopyWith(
          _TransportModel value, $Res Function(_TransportModel) then) =
      __$TransportModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? registrationNumber,
      int? seatsAvailable,
      TransportTypeModel? type,
      ImageModel? image,
      bool? atLocation,
      int? timeAvailable,
      bool? isAvailable,
      String? destinations,
      List<String>? destinationsIndex,
      UserInfoModel? user,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? createdAt,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? updatedAt,
      String? remarks,
      bool? isMock});

  @override
  $ImageModelCopyWith<$Res>? get image;
  @override
  $UserInfoModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$TransportModelCopyWithImpl<$Res>
    extends _$TransportModelCopyWithImpl<$Res>
    implements _$TransportModelCopyWith<$Res> {
  __$TransportModelCopyWithImpl(
      _TransportModel _value, $Res Function(_TransportModel) _then)
      : super(_value, (v) => _then(v as _TransportModel));

  @override
  _TransportModel get _value => super._value as _TransportModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? registrationNumber = freezed,
    Object? seatsAvailable = freezed,
    Object? type = freezed,
    Object? image = freezed,
    Object? atLocation = freezed,
    Object? timeAvailable = freezed,
    Object? isAvailable = freezed,
    Object? destinations = freezed,
    Object? destinationsIndex = freezed,
    Object? user = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? remarks = freezed,
    Object? isMock = freezed,
  }) {
    return _then(_TransportModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageModel?,
      atLocation: atLocation == freezed
          ? _value.atLocation
          : atLocation // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeAvailable: timeAvailable == freezed
          ? _value.timeAvailable
          : timeAvailable // ignore: cast_nullable_to_non_nullable
              as int?,
      isAvailable: isAvailable == freezed
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      destinations: destinations == freezed
          ? _value.destinations
          : destinations // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationsIndex: destinationsIndex == freezed
          ? _value.destinationsIndex
          : destinationsIndex // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserInfoModel?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      remarks: remarks == freezed
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      isMock: isMock == freezed
          ? _value.isMock
          : isMock // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_TransportModel extends _TransportModel {
  const _$_TransportModel(
      {this.id,
      this.registrationNumber,
      this.seatsAvailable = 0,
      this.type,
      this.image,
      this.atLocation = true,
      this.timeAvailable = 0,
      this.isAvailable = false,
      this.destinations,
      this.destinationsIndex,
      this.user,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          this.createdAt,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          this.updatedAt,
      this.remarks,
      this.isMock = false})
      : super._();

  factory _$_TransportModel.fromJson(Map<String, dynamic> json) =>
      _$$_TransportModelFromJson(json);

  @override
  final String? id;
  @override
  final String? registrationNumber;
  @JsonKey()
  @override
  final int? seatsAvailable;
  @override
  final TransportTypeModel? type;
  @override
  final ImageModel? image;
  @JsonKey()
  @override
  final bool? atLocation;
  @JsonKey()
  @override

  /// Time, in minutes, until the volunteer can get at site ([from]).
  ///
  /// If this is, he is already at the site.
  final int? timeAvailable;
  @JsonKey()
  @override
  final bool? isAvailable;
  @override
  final String? destinations;
  @override
  final List<String>? destinationsIndex;
  @override
  final UserInfoModel? user;
  @override
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime? createdAt;
  @override
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime? updatedAt;
  @override
  final String? remarks;
  @JsonKey()
  @override

  /// For development purposes.
  final bool? isMock;

  @override
  String toString() {
    return 'TransportModel(id: $id, registrationNumber: $registrationNumber, seatsAvailable: $seatsAvailable, type: $type, image: $image, atLocation: $atLocation, timeAvailable: $timeAvailable, isAvailable: $isAvailable, destinations: $destinations, destinationsIndex: $destinationsIndex, user: $user, createdAt: $createdAt, updatedAt: $updatedAt, remarks: $remarks, isMock: $isMock)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TransportModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.registrationNumber, registrationNumber) &&
            const DeepCollectionEquality()
                .equals(other.seatsAvailable, seatsAvailable) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality()
                .equals(other.atLocation, atLocation) &&
            const DeepCollectionEquality()
                .equals(other.timeAvailable, timeAvailable) &&
            const DeepCollectionEquality()
                .equals(other.isAvailable, isAvailable) &&
            const DeepCollectionEquality()
                .equals(other.destinations, destinations) &&
            const DeepCollectionEquality()
                .equals(other.destinationsIndex, destinationsIndex) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.remarks, remarks) &&
            const DeepCollectionEquality().equals(other.isMock, isMock));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(registrationNumber),
      const DeepCollectionEquality().hash(seatsAvailable),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(atLocation),
      const DeepCollectionEquality().hash(timeAvailable),
      const DeepCollectionEquality().hash(isAvailable),
      const DeepCollectionEquality().hash(destinations),
      const DeepCollectionEquality().hash(destinationsIndex),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(remarks),
      const DeepCollectionEquality().hash(isMock));

  @JsonKey(ignore: true)
  @override
  _$TransportModelCopyWith<_TransportModel> get copyWith =>
      __$TransportModelCopyWithImpl<_TransportModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransportModelToJson(this);
  }
}

abstract class _TransportModel extends TransportModel {
  const factory _TransportModel(
      {String? id,
      String? registrationNumber,
      int? seatsAvailable,
      TransportTypeModel? type,
      ImageModel? image,
      bool? atLocation,
      int? timeAvailable,
      bool? isAvailable,
      String? destinations,
      List<String>? destinationsIndex,
      UserInfoModel? user,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? createdAt,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? updatedAt,
      String? remarks,
      bool? isMock}) = _$_TransportModel;
  const _TransportModel._() : super._();

  factory _TransportModel.fromJson(Map<String, dynamic> json) =
      _$_TransportModel.fromJson;

  @override
  String? get id;
  @override
  String? get registrationNumber;
  @override
  int? get seatsAvailable;
  @override
  TransportTypeModel? get type;
  @override
  ImageModel? get image;
  @override
  bool? get atLocation;
  @override

  /// Time, in minutes, until the volunteer can get at site ([from]).
  ///
  /// If this is, he is already at the site.
  int? get timeAvailable;
  @override
  bool? get isAvailable;
  @override
  String? get destinations;
  @override
  List<String>? get destinationsIndex;
  @override
  UserInfoModel? get user;
  @override
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime? get createdAt;
  @override
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime? get updatedAt;
  @override
  String? get remarks;
  @override

  /// For development purposes.
  bool? get isMock;
  @override
  @JsonKey(ignore: true)
  _$TransportModelCopyWith<_TransportModel> get copyWith =>
      throw _privateConstructorUsedError;
}
