// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'list_tickets_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ListTicketsRequestModelTearOff {
  const _$ListTicketsRequestModelTearOff();

  _ListTicketsRequestModel call(
      {int limit = 20,
      TicketTypeModel? type,
      bool goBack = false,
      FirestorePaginationInfo<dynamic>? paginationInfo,
      String? userId,
      bool isDesktop = false}) {
    return _ListTicketsRequestModel(
      limit: limit,
      type: type,
      goBack: goBack,
      paginationInfo: paginationInfo,
      userId: userId,
      isDesktop: isDesktop,
    );
  }
}

/// @nodoc
const $ListTicketsRequestModel = _$ListTicketsRequestModelTearOff();

/// @nodoc
mixin _$ListTicketsRequestModel {
  int get limit => throw _privateConstructorUsedError;
  TicketTypeModel? get type => throw _privateConstructorUsedError;
  bool get goBack => throw _privateConstructorUsedError;
  FirestorePaginationInfo<dynamic>? get paginationInfo =>
      throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  bool get isDesktop => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListTicketsRequestModelCopyWith<ListTicketsRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListTicketsRequestModelCopyWith<$Res> {
  factory $ListTicketsRequestModelCopyWith(ListTicketsRequestModel value,
          $Res Function(ListTicketsRequestModel) then) =
      _$ListTicketsRequestModelCopyWithImpl<$Res>;
  $Res call(
      {int limit,
      TicketTypeModel? type,
      bool goBack,
      FirestorePaginationInfo<dynamic>? paginationInfo,
      String? userId,
      bool isDesktop});
}

/// @nodoc
class _$ListTicketsRequestModelCopyWithImpl<$Res>
    implements $ListTicketsRequestModelCopyWith<$Res> {
  _$ListTicketsRequestModelCopyWithImpl(this._value, this._then);

  final ListTicketsRequestModel _value;
  // ignore: unused_field
  final $Res Function(ListTicketsRequestModel) _then;

  @override
  $Res call({
    Object? limit = freezed,
    Object? type = freezed,
    Object? goBack = freezed,
    Object? paginationInfo = freezed,
    Object? userId = freezed,
    Object? isDesktop = freezed,
  }) {
    return _then(_value.copyWith(
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TicketTypeModel?,
      goBack: goBack == freezed
          ? _value.goBack
          : goBack // ignore: cast_nullable_to_non_nullable
              as bool,
      paginationInfo: paginationInfo == freezed
          ? _value.paginationInfo
          : paginationInfo // ignore: cast_nullable_to_non_nullable
              as FirestorePaginationInfo<dynamic>?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      isDesktop: isDesktop == freezed
          ? _value.isDesktop
          : isDesktop // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ListTicketsRequestModelCopyWith<$Res>
    implements $ListTicketsRequestModelCopyWith<$Res> {
  factory _$ListTicketsRequestModelCopyWith(_ListTicketsRequestModel value,
          $Res Function(_ListTicketsRequestModel) then) =
      __$ListTicketsRequestModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int limit,
      TicketTypeModel? type,
      bool goBack,
      FirestorePaginationInfo<dynamic>? paginationInfo,
      String? userId,
      bool isDesktop});
}

/// @nodoc
class __$ListTicketsRequestModelCopyWithImpl<$Res>
    extends _$ListTicketsRequestModelCopyWithImpl<$Res>
    implements _$ListTicketsRequestModelCopyWith<$Res> {
  __$ListTicketsRequestModelCopyWithImpl(_ListTicketsRequestModel _value,
      $Res Function(_ListTicketsRequestModel) _then)
      : super(_value, (v) => _then(v as _ListTicketsRequestModel));

  @override
  _ListTicketsRequestModel get _value =>
      super._value as _ListTicketsRequestModel;

  @override
  $Res call({
    Object? limit = freezed,
    Object? type = freezed,
    Object? goBack = freezed,
    Object? paginationInfo = freezed,
    Object? userId = freezed,
    Object? isDesktop = freezed,
  }) {
    return _then(_ListTicketsRequestModel(
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TicketTypeModel?,
      goBack: goBack == freezed
          ? _value.goBack
          : goBack // ignore: cast_nullable_to_non_nullable
              as bool,
      paginationInfo: paginationInfo == freezed
          ? _value.paginationInfo
          : paginationInfo // ignore: cast_nullable_to_non_nullable
              as FirestorePaginationInfo<dynamic>?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      isDesktop: isDesktop == freezed
          ? _value.isDesktop
          : isDesktop // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ListTicketsRequestModel implements _ListTicketsRequestModel {
  const _$_ListTicketsRequestModel(
      {this.limit = 20,
      this.type,
      this.goBack = false,
      this.paginationInfo,
      this.userId,
      this.isDesktop = false});

  @JsonKey()
  @override
  final int limit;
  @override
  final TicketTypeModel? type;
  @JsonKey()
  @override
  final bool goBack;
  @override
  final FirestorePaginationInfo<dynamic>? paginationInfo;
  @override
  final String? userId;
  @JsonKey()
  @override
  final bool isDesktop;

  @override
  String toString() {
    return 'ListTicketsRequestModel(limit: $limit, type: $type, goBack: $goBack, paginationInfo: $paginationInfo, userId: $userId, isDesktop: $isDesktop)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListTicketsRequestModel &&
            const DeepCollectionEquality().equals(other.limit, limit) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.goBack, goBack) &&
            const DeepCollectionEquality()
                .equals(other.paginationInfo, paginationInfo) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.isDesktop, isDesktop));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(limit),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(goBack),
      const DeepCollectionEquality().hash(paginationInfo),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(isDesktop));

  @JsonKey(ignore: true)
  @override
  _$ListTicketsRequestModelCopyWith<_ListTicketsRequestModel> get copyWith =>
      __$ListTicketsRequestModelCopyWithImpl<_ListTicketsRequestModel>(
          this, _$identity);
}

abstract class _ListTicketsRequestModel implements ListTicketsRequestModel {
  const factory _ListTicketsRequestModel(
      {int limit,
      TicketTypeModel? type,
      bool goBack,
      FirestorePaginationInfo<dynamic>? paginationInfo,
      String? userId,
      bool isDesktop}) = _$_ListTicketsRequestModel;

  @override
  int get limit;
  @override
  TicketTypeModel? get type;
  @override
  bool get goBack;
  @override
  FirestorePaginationInfo<dynamic>? get paginationInfo;
  @override
  String? get userId;
  @override
  bool get isDesktop;
  @override
  @JsonKey(ignore: true)
  _$ListTicketsRequestModelCopyWith<_ListTicketsRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
