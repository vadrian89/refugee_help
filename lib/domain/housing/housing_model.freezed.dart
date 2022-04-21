// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'housing_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HousingModel _$HousingModelFromJson(Map<String, dynamic> json) {
  return _HousingModel.fromJson(json);
}

/// @nodoc
class _$HousingModelTearOff {
  const _$HousingModelTearOff();

  _HousingModel call(
      {String? id,
      int? bedsAvailable = 0,
      int? period = 2,
      List<ImageModel>? imageList,
      @JsonKey(ignore: true)
          List<ImageModel>? imagesToDelete,
      bool? isAvailable = true,
      bool? hasTransport = true,
      String? country = "Romania",
      String? countryIndex,
      String? county,
      String? countyIndex,
      String? city,
      String? cityIndex,
      String? address,
      String? addressIndex,
      UserInfoModel? user,
      HousingTypeModel? type,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? createdAt,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? updatedAt,
      String? remarks,
      bool? isMock = false}) {
    return _HousingModel(
      id: id,
      bedsAvailable: bedsAvailable,
      period: period,
      imageList: imageList,
      imagesToDelete: imagesToDelete,
      isAvailable: isAvailable,
      hasTransport: hasTransport,
      country: country,
      countryIndex: countryIndex,
      county: county,
      countyIndex: countyIndex,
      city: city,
      cityIndex: cityIndex,
      address: address,
      addressIndex: addressIndex,
      user: user,
      type: type,
      createdAt: createdAt,
      updatedAt: updatedAt,
      remarks: remarks,
      isMock: isMock,
    );
  }

  HousingModel fromJson(Map<String, Object?> json) {
    return HousingModel.fromJson(json);
  }
}

/// @nodoc
const $HousingModel = _$HousingModelTearOff();

/// @nodoc
mixin _$HousingModel {
  /// The housing id.
  String? get id => throw _privateConstructorUsedError;

  /// Number of beds available for this housing option.
  int? get bedsAvailable => throw _privateConstructorUsedError;

  /// Time period for housing.
  ///
  /// 1 - short term period, 2 - long term period
  int? get period => throw _privateConstructorUsedError;

  /// Images of the housing.
  List<ImageModel>? get imageList => throw _privateConstructorUsedError;

  /// Images which should be deleted.
  @JsonKey(ignore: true)
  List<ImageModel>? get imagesToDelete => throw _privateConstructorUsedError;

  /// If is available.
  bool? get isAvailable => throw _privateConstructorUsedError;

  /// If the owner ofers transport to the housing.
  bool? get hasTransport => throw _privateConstructorUsedError;

  /// The country of the housing's location.
  String? get country => throw _privateConstructorUsedError;

  /// The search index for the [country].
  String? get countryIndex => throw _privateConstructorUsedError;

  /// The county of the housing's location.
  String? get county => throw _privateConstructorUsedError;

  /// The search index for the [county].
  String? get countyIndex => throw _privateConstructorUsedError;

  /// The city of the housing's location.
  String? get city => throw _privateConstructorUsedError;

  /// The search index for the [city].
  String? get cityIndex => throw _privateConstructorUsedError;

  /// The address of the housing's location.
  String? get address => throw _privateConstructorUsedError;

  /// The index of the [address].
  String? get addressIndex => throw _privateConstructorUsedError;

  /// The user owning the housing.
  UserInfoModel? get user => throw _privateConstructorUsedError;

  /// Housing type
  HousingTypeModel? get type => throw _privateConstructorUsedError;

  /// Creation date.
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// When was the entry last updated.
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Aditional remarks
  String? get remarks => throw _privateConstructorUsedError;

  /// For development purposes.
  bool? get isMock => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HousingModelCopyWith<HousingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HousingModelCopyWith<$Res> {
  factory $HousingModelCopyWith(
          HousingModel value, $Res Function(HousingModel) then) =
      _$HousingModelCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      int? bedsAvailable,
      int? period,
      List<ImageModel>? imageList,
      @JsonKey(ignore: true)
          List<ImageModel>? imagesToDelete,
      bool? isAvailable,
      bool? hasTransport,
      String? country,
      String? countryIndex,
      String? county,
      String? countyIndex,
      String? city,
      String? cityIndex,
      String? address,
      String? addressIndex,
      UserInfoModel? user,
      HousingTypeModel? type,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? createdAt,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? updatedAt,
      String? remarks,
      bool? isMock});

  $UserInfoModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$HousingModelCopyWithImpl<$Res> implements $HousingModelCopyWith<$Res> {
  _$HousingModelCopyWithImpl(this._value, this._then);

  final HousingModel _value;
  // ignore: unused_field
  final $Res Function(HousingModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? bedsAvailable = freezed,
    Object? period = freezed,
    Object? imageList = freezed,
    Object? imagesToDelete = freezed,
    Object? isAvailable = freezed,
    Object? hasTransport = freezed,
    Object? country = freezed,
    Object? countryIndex = freezed,
    Object? county = freezed,
    Object? countyIndex = freezed,
    Object? city = freezed,
    Object? cityIndex = freezed,
    Object? address = freezed,
    Object? addressIndex = freezed,
    Object? user = freezed,
    Object? type = freezed,
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
      bedsAvailable: bedsAvailable == freezed
          ? _value.bedsAvailable
          : bedsAvailable // ignore: cast_nullable_to_non_nullable
              as int?,
      period: period == freezed
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as int?,
      imageList: imageList == freezed
          ? _value.imageList
          : imageList // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>?,
      imagesToDelete: imagesToDelete == freezed
          ? _value.imagesToDelete
          : imagesToDelete // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>?,
      isAvailable: isAvailable == freezed
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasTransport: hasTransport == freezed
          ? _value.hasTransport
          : hasTransport // ignore: cast_nullable_to_non_nullable
              as bool?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      countryIndex: countryIndex == freezed
          ? _value.countryIndex
          : countryIndex // ignore: cast_nullable_to_non_nullable
              as String?,
      county: county == freezed
          ? _value.county
          : county // ignore: cast_nullable_to_non_nullable
              as String?,
      countyIndex: countyIndex == freezed
          ? _value.countyIndex
          : countyIndex // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      cityIndex: cityIndex == freezed
          ? _value.cityIndex
          : cityIndex // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      addressIndex: addressIndex == freezed
          ? _value.addressIndex
          : addressIndex // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserInfoModel?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HousingTypeModel?,
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
abstract class _$HousingModelCopyWith<$Res>
    implements $HousingModelCopyWith<$Res> {
  factory _$HousingModelCopyWith(
          _HousingModel value, $Res Function(_HousingModel) then) =
      __$HousingModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      int? bedsAvailable,
      int? period,
      List<ImageModel>? imageList,
      @JsonKey(ignore: true)
          List<ImageModel>? imagesToDelete,
      bool? isAvailable,
      bool? hasTransport,
      String? country,
      String? countryIndex,
      String? county,
      String? countyIndex,
      String? city,
      String? cityIndex,
      String? address,
      String? addressIndex,
      UserInfoModel? user,
      HousingTypeModel? type,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? createdAt,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? updatedAt,
      String? remarks,
      bool? isMock});

  @override
  $UserInfoModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$HousingModelCopyWithImpl<$Res> extends _$HousingModelCopyWithImpl<$Res>
    implements _$HousingModelCopyWith<$Res> {
  __$HousingModelCopyWithImpl(
      _HousingModel _value, $Res Function(_HousingModel) _then)
      : super(_value, (v) => _then(v as _HousingModel));

  @override
  _HousingModel get _value => super._value as _HousingModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? bedsAvailable = freezed,
    Object? period = freezed,
    Object? imageList = freezed,
    Object? imagesToDelete = freezed,
    Object? isAvailable = freezed,
    Object? hasTransport = freezed,
    Object? country = freezed,
    Object? countryIndex = freezed,
    Object? county = freezed,
    Object? countyIndex = freezed,
    Object? city = freezed,
    Object? cityIndex = freezed,
    Object? address = freezed,
    Object? addressIndex = freezed,
    Object? user = freezed,
    Object? type = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? remarks = freezed,
    Object? isMock = freezed,
  }) {
    return _then(_HousingModel(
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
      imageList: imageList == freezed
          ? _value.imageList
          : imageList // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>?,
      imagesToDelete: imagesToDelete == freezed
          ? _value.imagesToDelete
          : imagesToDelete // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>?,
      isAvailable: isAvailable == freezed
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasTransport: hasTransport == freezed
          ? _value.hasTransport
          : hasTransport // ignore: cast_nullable_to_non_nullable
              as bool?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      countryIndex: countryIndex == freezed
          ? _value.countryIndex
          : countryIndex // ignore: cast_nullable_to_non_nullable
              as String?,
      county: county == freezed
          ? _value.county
          : county // ignore: cast_nullable_to_non_nullable
              as String?,
      countyIndex: countyIndex == freezed
          ? _value.countyIndex
          : countyIndex // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      cityIndex: cityIndex == freezed
          ? _value.cityIndex
          : cityIndex // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      addressIndex: addressIndex == freezed
          ? _value.addressIndex
          : addressIndex // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserInfoModel?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HousingTypeModel?,
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
class _$_HousingModel extends _HousingModel {
  const _$_HousingModel(
      {this.id,
      this.bedsAvailable = 0,
      this.period = 2,
      this.imageList,
      @JsonKey(ignore: true)
          this.imagesToDelete,
      this.isAvailable = true,
      this.hasTransport = true,
      this.country = "Romania",
      this.countryIndex,
      this.county,
      this.countyIndex,
      this.city,
      this.cityIndex,
      this.address,
      this.addressIndex,
      this.user,
      this.type,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          this.createdAt,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          this.updatedAt,
      this.remarks,
      this.isMock = false})
      : super._();

  factory _$_HousingModel.fromJson(Map<String, dynamic> json) =>
      _$$_HousingModelFromJson(json);

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

  /// Images of the housing.
  final List<ImageModel>? imageList;
  @override

  /// Images which should be deleted.
  @JsonKey(ignore: true)
  final List<ImageModel>? imagesToDelete;
  @JsonKey()
  @override

  /// If is available.
  final bool? isAvailable;
  @JsonKey()
  @override

  /// If the owner ofers transport to the housing.
  final bool? hasTransport;
  @JsonKey()
  @override

  /// The country of the housing's location.
  final String? country;
  @override

  /// The search index for the [country].
  final String? countryIndex;
  @override

  /// The county of the housing's location.
  final String? county;
  @override

  /// The search index for the [county].
  final String? countyIndex;
  @override

  /// The city of the housing's location.
  final String? city;
  @override

  /// The search index for the [city].
  final String? cityIndex;
  @override

  /// The address of the housing's location.
  final String? address;
  @override

  /// The index of the [address].
  final String? addressIndex;
  @override

  /// The user owning the housing.
  final UserInfoModel? user;
  @override

  /// Housing type
  final HousingTypeModel? type;
  @override

  /// Creation date.
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime? createdAt;
  @override

  /// When was the entry last updated.
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime? updatedAt;
  @override

  /// Aditional remarks
  final String? remarks;
  @JsonKey()
  @override

  /// For development purposes.
  final bool? isMock;

  @override
  String toString() {
    return 'HousingModel(id: $id, bedsAvailable: $bedsAvailable, period: $period, imageList: $imageList, imagesToDelete: $imagesToDelete, isAvailable: $isAvailable, hasTransport: $hasTransport, country: $country, countryIndex: $countryIndex, county: $county, countyIndex: $countyIndex, city: $city, cityIndex: $cityIndex, address: $address, addressIndex: $addressIndex, user: $user, type: $type, createdAt: $createdAt, updatedAt: $updatedAt, remarks: $remarks, isMock: $isMock)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HousingModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.bedsAvailable, bedsAvailable) &&
            const DeepCollectionEquality().equals(other.period, period) &&
            const DeepCollectionEquality().equals(other.imageList, imageList) &&
            const DeepCollectionEquality()
                .equals(other.imagesToDelete, imagesToDelete) &&
            const DeepCollectionEquality()
                .equals(other.isAvailable, isAvailable) &&
            const DeepCollectionEquality()
                .equals(other.hasTransport, hasTransport) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality()
                .equals(other.countryIndex, countryIndex) &&
            const DeepCollectionEquality().equals(other.county, county) &&
            const DeepCollectionEquality()
                .equals(other.countyIndex, countyIndex) &&
            const DeepCollectionEquality().equals(other.city, city) &&
            const DeepCollectionEquality().equals(other.cityIndex, cityIndex) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.addressIndex, addressIndex) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.remarks, remarks) &&
            const DeepCollectionEquality().equals(other.isMock, isMock));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(bedsAvailable),
        const DeepCollectionEquality().hash(period),
        const DeepCollectionEquality().hash(imageList),
        const DeepCollectionEquality().hash(imagesToDelete),
        const DeepCollectionEquality().hash(isAvailable),
        const DeepCollectionEquality().hash(hasTransport),
        const DeepCollectionEquality().hash(country),
        const DeepCollectionEquality().hash(countryIndex),
        const DeepCollectionEquality().hash(county),
        const DeepCollectionEquality().hash(countyIndex),
        const DeepCollectionEquality().hash(city),
        const DeepCollectionEquality().hash(cityIndex),
        const DeepCollectionEquality().hash(address),
        const DeepCollectionEquality().hash(addressIndex),
        const DeepCollectionEquality().hash(user),
        const DeepCollectionEquality().hash(type),
        const DeepCollectionEquality().hash(createdAt),
        const DeepCollectionEquality().hash(updatedAt),
        const DeepCollectionEquality().hash(remarks),
        const DeepCollectionEquality().hash(isMock)
      ]);

  @JsonKey(ignore: true)
  @override
  _$HousingModelCopyWith<_HousingModel> get copyWith =>
      __$HousingModelCopyWithImpl<_HousingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HousingModelToJson(this);
  }
}

abstract class _HousingModel extends HousingModel {
  const factory _HousingModel(
      {String? id,
      int? bedsAvailable,
      int? period,
      List<ImageModel>? imageList,
      @JsonKey(ignore: true)
          List<ImageModel>? imagesToDelete,
      bool? isAvailable,
      bool? hasTransport,
      String? country,
      String? countryIndex,
      String? county,
      String? countyIndex,
      String? city,
      String? cityIndex,
      String? address,
      String? addressIndex,
      UserInfoModel? user,
      HousingTypeModel? type,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? createdAt,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? updatedAt,
      String? remarks,
      bool? isMock}) = _$_HousingModel;
  const _HousingModel._() : super._();

  factory _HousingModel.fromJson(Map<String, dynamic> json) =
      _$_HousingModel.fromJson;

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

  /// Images of the housing.
  List<ImageModel>? get imageList;
  @override

  /// Images which should be deleted.
  @JsonKey(ignore: true)
  List<ImageModel>? get imagesToDelete;
  @override

  /// If is available.
  bool? get isAvailable;
  @override

  /// If the owner ofers transport to the housing.
  bool? get hasTransport;
  @override

  /// The country of the housing's location.
  String? get country;
  @override

  /// The search index for the [country].
  String? get countryIndex;
  @override

  /// The county of the housing's location.
  String? get county;
  @override

  /// The search index for the [county].
  String? get countyIndex;
  @override

  /// The city of the housing's location.
  String? get city;
  @override

  /// The search index for the [city].
  String? get cityIndex;
  @override

  /// The address of the housing's location.
  String? get address;
  @override

  /// The index of the [address].
  String? get addressIndex;
  @override

  /// The user owning the housing.
  UserInfoModel? get user;
  @override

  /// Housing type
  HousingTypeModel? get type;
  @override

  /// Creation date.
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime? get createdAt;
  @override

  /// When was the entry last updated.
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime? get updatedAt;
  @override

  /// Aditional remarks
  String? get remarks;
  @override

  /// For development purposes.
  bool? get isMock;
  @override
  @JsonKey(ignore: true)
  _$HousingModelCopyWith<_HousingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
