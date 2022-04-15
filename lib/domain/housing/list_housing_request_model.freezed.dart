// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'list_housing_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ListHousingRequestModelTearOff {
  const _$ListHousingRequestModelTearOff();

  _ListHousingRequestModel call(
      {int? bedsAvailable, int? limit, bool? isAvailable, String? userId}) {
    return _ListHousingRequestModel(
      bedsAvailable: bedsAvailable,
      limit: limit,
      isAvailable: isAvailable,
      userId: userId,
    );
  }
}

/// @nodoc
const $ListHousingRequestModel = _$ListHousingRequestModelTearOff();

/// @nodoc
mixin _$ListHousingRequestModel {
  int? get bedsAvailable => throw _privateConstructorUsedError;
  int? get limit => throw _privateConstructorUsedError;
  bool? get isAvailable => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListHousingRequestModelCopyWith<ListHousingRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListHousingRequestModelCopyWith<$Res> {
  factory $ListHousingRequestModelCopyWith(ListHousingRequestModel value,
          $Res Function(ListHousingRequestModel) then) =
      _$ListHousingRequestModelCopyWithImpl<$Res>;
  $Res call(
      {int? bedsAvailable, int? limit, bool? isAvailable, String? userId});
}

/// @nodoc
class _$ListHousingRequestModelCopyWithImpl<$Res>
    implements $ListHousingRequestModelCopyWith<$Res> {
  _$ListHousingRequestModelCopyWithImpl(this._value, this._then);

  final ListHousingRequestModel _value;
  // ignore: unused_field
  final $Res Function(ListHousingRequestModel) _then;

  @override
  $Res call({
    Object? bedsAvailable = freezed,
    Object? limit = freezed,
    Object? isAvailable = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      bedsAvailable: bedsAvailable == freezed
          ? _value.bedsAvailable
          : bedsAvailable // ignore: cast_nullable_to_non_nullable
              as int?,
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
    ));
  }
}

/// @nodoc
abstract class _$ListHousingRequestModelCopyWith<$Res>
    implements $ListHousingRequestModelCopyWith<$Res> {
  factory _$ListHousingRequestModelCopyWith(_ListHousingRequestModel value,
          $Res Function(_ListHousingRequestModel) then) =
      __$ListHousingRequestModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? bedsAvailable, int? limit, bool? isAvailable, String? userId});
}

/// @nodoc
class __$ListHousingRequestModelCopyWithImpl<$Res>
    extends _$ListHousingRequestModelCopyWithImpl<$Res>
    implements _$ListHousingRequestModelCopyWith<$Res> {
  __$ListHousingRequestModelCopyWithImpl(_ListHousingRequestModel _value,
      $Res Function(_ListHousingRequestModel) _then)
      : super(_value, (v) => _then(v as _ListHousingRequestModel));

  @override
  _ListHousingRequestModel get _value =>
      super._value as _ListHousingRequestModel;

  @override
  $Res call({
    Object? bedsAvailable = freezed,
    Object? limit = freezed,
    Object? isAvailable = freezed,
    Object? userId = freezed,
  }) {
    return _then(_ListHousingRequestModel(
      bedsAvailable: bedsAvailable == freezed
          ? _value.bedsAvailable
          : bedsAvailable // ignore: cast_nullable_to_non_nullable
              as int?,
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
    ));
  }
}

/// @nodoc

class _$_ListHousingRequestModel implements _ListHousingRequestModel {
  const _$_ListHousingRequestModel(
      {this.bedsAvailable, this.limit, this.isAvailable, this.userId});

  @override
  final int? bedsAvailable;
  @override
  final int? limit;
  @override
  final bool? isAvailable;
  @override
  final String? userId;

  @override
  String toString() {
    return 'ListHousingRequestModel(bedsAvailable: $bedsAvailable, limit: $limit, isAvailable: $isAvailable, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListHousingRequestModel &&
            const DeepCollectionEquality()
                .equals(other.bedsAvailable, bedsAvailable) &&
            const DeepCollectionEquality().equals(other.limit, limit) &&
            const DeepCollectionEquality()
                .equals(other.isAvailable, isAvailable) &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(bedsAvailable),
      const DeepCollectionEquality().hash(limit),
      const DeepCollectionEquality().hash(isAvailable),
      const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$ListHousingRequestModelCopyWith<_ListHousingRequestModel> get copyWith =>
      __$ListHousingRequestModelCopyWithImpl<_ListHousingRequestModel>(
          this, _$identity);
}

abstract class _ListHousingRequestModel implements ListHousingRequestModel {
  const factory _ListHousingRequestModel(
      {int? bedsAvailable,
      int? limit,
      bool? isAvailable,
      String? userId}) = _$_ListHousingRequestModel;

  @override
  int? get bedsAvailable;
  @override
  int? get limit;
  @override
  bool? get isAvailable;
  @override
  String? get userId;
  @override
  @JsonKey(ignore: true)
  _$ListHousingRequestModelCopyWith<_ListHousingRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
