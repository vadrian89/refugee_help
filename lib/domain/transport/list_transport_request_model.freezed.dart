// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'list_transport_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ListTransportRequestModelTearOff {
  const _$ListTransportRequestModelTearOff();

  _ListTransportRequestModel call(
      {int? seatsAvailable,
      TransportTypeModel? transportType,
      int? limit,
      bool? isAvailable,
      String? userId,
      String? destinations}) {
    return _ListTransportRequestModel(
      seatsAvailable: seatsAvailable,
      transportType: transportType,
      limit: limit,
      isAvailable: isAvailable,
      userId: userId,
      destinations: destinations,
    );
  }
}

/// @nodoc
const $ListTransportRequestModel = _$ListTransportRequestModelTearOff();

/// @nodoc
mixin _$ListTransportRequestModel {
  int? get seatsAvailable => throw _privateConstructorUsedError;
  TransportTypeModel? get transportType => throw _privateConstructorUsedError;
  int? get limit => throw _privateConstructorUsedError;
  bool? get isAvailable => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get destinations => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListTransportRequestModelCopyWith<ListTransportRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListTransportRequestModelCopyWith<$Res> {
  factory $ListTransportRequestModelCopyWith(ListTransportRequestModel value,
          $Res Function(ListTransportRequestModel) then) =
      _$ListTransportRequestModelCopyWithImpl<$Res>;
  $Res call(
      {int? seatsAvailable,
      TransportTypeModel? transportType,
      int? limit,
      bool? isAvailable,
      String? userId,
      String? destinations});
}

/// @nodoc
class _$ListTransportRequestModelCopyWithImpl<$Res>
    implements $ListTransportRequestModelCopyWith<$Res> {
  _$ListTransportRequestModelCopyWithImpl(this._value, this._then);

  final ListTransportRequestModel _value;
  // ignore: unused_field
  final $Res Function(ListTransportRequestModel) _then;

  @override
  $Res call({
    Object? seatsAvailable = freezed,
    Object? transportType = freezed,
    Object? limit = freezed,
    Object? isAvailable = freezed,
    Object? userId = freezed,
    Object? destinations = freezed,
  }) {
    return _then(_value.copyWith(
      seatsAvailable: seatsAvailable == freezed
          ? _value.seatsAvailable
          : seatsAvailable // ignore: cast_nullable_to_non_nullable
              as int?,
      transportType: transportType == freezed
          ? _value.transportType
          : transportType // ignore: cast_nullable_to_non_nullable
              as TransportTypeModel?,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      isAvailable: isAvailable == freezed
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      destinations: destinations == freezed
          ? _value.destinations
          : destinations // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ListTransportRequestModelCopyWith<$Res>
    implements $ListTransportRequestModelCopyWith<$Res> {
  factory _$ListTransportRequestModelCopyWith(_ListTransportRequestModel value,
          $Res Function(_ListTransportRequestModel) then) =
      __$ListTransportRequestModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? seatsAvailable,
      TransportTypeModel? transportType,
      int? limit,
      bool? isAvailable,
      String? userId,
      String? destinations});
}

/// @nodoc
class __$ListTransportRequestModelCopyWithImpl<$Res>
    extends _$ListTransportRequestModelCopyWithImpl<$Res>
    implements _$ListTransportRequestModelCopyWith<$Res> {
  __$ListTransportRequestModelCopyWithImpl(_ListTransportRequestModel _value,
      $Res Function(_ListTransportRequestModel) _then)
      : super(_value, (v) => _then(v as _ListTransportRequestModel));

  @override
  _ListTransportRequestModel get _value =>
      super._value as _ListTransportRequestModel;

  @override
  $Res call({
    Object? seatsAvailable = freezed,
    Object? transportType = freezed,
    Object? limit = freezed,
    Object? isAvailable = freezed,
    Object? userId = freezed,
    Object? destinations = freezed,
  }) {
    return _then(_ListTransportRequestModel(
      seatsAvailable: seatsAvailable == freezed
          ? _value.seatsAvailable
          : seatsAvailable // ignore: cast_nullable_to_non_nullable
              as int?,
      transportType: transportType == freezed
          ? _value.transportType
          : transportType // ignore: cast_nullable_to_non_nullable
              as TransportTypeModel?,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      isAvailable: isAvailable == freezed
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      destinations: destinations == freezed
          ? _value.destinations
          : destinations // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ListTransportRequestModel implements _ListTransportRequestModel {
  const _$_ListTransportRequestModel(
      {this.seatsAvailable,
      this.transportType,
      this.limit,
      this.isAvailable,
      this.userId,
      this.destinations});

  @override
  final int? seatsAvailable;
  @override
  final TransportTypeModel? transportType;
  @override
  final int? limit;
  @override
  final bool? isAvailable;
  @override
  final String? userId;
  @override
  final String? destinations;

  @override
  String toString() {
    return 'ListTransportRequestModel(seatsAvailable: $seatsAvailable, transportType: $transportType, limit: $limit, isAvailable: $isAvailable, userId: $userId, destinations: $destinations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListTransportRequestModel &&
            const DeepCollectionEquality()
                .equals(other.seatsAvailable, seatsAvailable) &&
            const DeepCollectionEquality()
                .equals(other.transportType, transportType) &&
            const DeepCollectionEquality().equals(other.limit, limit) &&
            const DeepCollectionEquality()
                .equals(other.isAvailable, isAvailable) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.destinations, destinations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(seatsAvailable),
      const DeepCollectionEquality().hash(transportType),
      const DeepCollectionEquality().hash(limit),
      const DeepCollectionEquality().hash(isAvailable),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(destinations));

  @JsonKey(ignore: true)
  @override
  _$ListTransportRequestModelCopyWith<_ListTransportRequestModel>
      get copyWith =>
          __$ListTransportRequestModelCopyWithImpl<_ListTransportRequestModel>(
              this, _$identity);
}

abstract class _ListTransportRequestModel implements ListTransportRequestModel {
  const factory _ListTransportRequestModel(
      {int? seatsAvailable,
      TransportTypeModel? transportType,
      int? limit,
      bool? isAvailable,
      String? userId,
      String? destinations}) = _$_ListTransportRequestModel;

  @override
  int? get seatsAvailable;
  @override
  TransportTypeModel? get transportType;
  @override
  int? get limit;
  @override
  bool? get isAvailable;
  @override
  String? get userId;
  @override
  String? get destinations;
  @override
  @JsonKey(ignore: true)
  _$ListTransportRequestModelCopyWith<_ListTransportRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}
