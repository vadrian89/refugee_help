// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transport_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TransportRequestTearOff {
  const _$TransportRequestTearOff();

  _TransportRequest call(
      {int? seatsAvailable,
      TransportTypeModel? transportType,
      bool? isAvailable = true,
      String? docId,
      bool goBack = false}) {
    return _TransportRequest(
      seatsAvailable: seatsAvailable,
      transportType: transportType,
      isAvailable: isAvailable,
      docId: docId,
      goBack: goBack,
    );
  }
}

/// @nodoc
const $TransportRequest = _$TransportRequestTearOff();

/// @nodoc
mixin _$TransportRequest {
  int? get seatsAvailable => throw _privateConstructorUsedError;
  TransportTypeModel? get transportType => throw _privateConstructorUsedError;
  bool? get isAvailable => throw _privateConstructorUsedError;
  String? get docId => throw _privateConstructorUsedError;
  bool get goBack => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransportRequestCopyWith<TransportRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransportRequestCopyWith<$Res> {
  factory $TransportRequestCopyWith(
          TransportRequest value, $Res Function(TransportRequest) then) =
      _$TransportRequestCopyWithImpl<$Res>;
  $Res call(
      {int? seatsAvailable,
      TransportTypeModel? transportType,
      bool? isAvailable,
      String? docId,
      bool goBack});
}

/// @nodoc
class _$TransportRequestCopyWithImpl<$Res>
    implements $TransportRequestCopyWith<$Res> {
  _$TransportRequestCopyWithImpl(this._value, this._then);

  final TransportRequest _value;
  // ignore: unused_field
  final $Res Function(TransportRequest) _then;

  @override
  $Res call({
    Object? seatsAvailable = freezed,
    Object? transportType = freezed,
    Object? isAvailable = freezed,
    Object? docId = freezed,
    Object? goBack = freezed,
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
      isAvailable: isAvailable == freezed
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      docId: docId == freezed
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      goBack: goBack == freezed
          ? _value.goBack
          : goBack // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$TransportRequestCopyWith<$Res>
    implements $TransportRequestCopyWith<$Res> {
  factory _$TransportRequestCopyWith(
          _TransportRequest value, $Res Function(_TransportRequest) then) =
      __$TransportRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? seatsAvailable,
      TransportTypeModel? transportType,
      bool? isAvailable,
      String? docId,
      bool goBack});
}

/// @nodoc
class __$TransportRequestCopyWithImpl<$Res>
    extends _$TransportRequestCopyWithImpl<$Res>
    implements _$TransportRequestCopyWith<$Res> {
  __$TransportRequestCopyWithImpl(
      _TransportRequest _value, $Res Function(_TransportRequest) _then)
      : super(_value, (v) => _then(v as _TransportRequest));

  @override
  _TransportRequest get _value => super._value as _TransportRequest;

  @override
  $Res call({
    Object? seatsAvailable = freezed,
    Object? transportType = freezed,
    Object? isAvailable = freezed,
    Object? docId = freezed,
    Object? goBack = freezed,
  }) {
    return _then(_TransportRequest(
      seatsAvailable: seatsAvailable == freezed
          ? _value.seatsAvailable
          : seatsAvailable // ignore: cast_nullable_to_non_nullable
              as int?,
      transportType: transportType == freezed
          ? _value.transportType
          : transportType // ignore: cast_nullable_to_non_nullable
              as TransportTypeModel?,
      isAvailable: isAvailable == freezed
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
      docId: docId == freezed
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      goBack: goBack == freezed
          ? _value.goBack
          : goBack // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TransportRequest implements _TransportRequest {
  const _$_TransportRequest(
      {this.seatsAvailable,
      this.transportType,
      this.isAvailable = true,
      this.docId,
      this.goBack = false});

  @override
  final int? seatsAvailable;
  @override
  final TransportTypeModel? transportType;
  @JsonKey()
  @override
  final bool? isAvailable;
  @override
  final String? docId;
  @JsonKey()
  @override
  final bool goBack;

  @override
  String toString() {
    return 'TransportRequest(seatsAvailable: $seatsAvailable, transportType: $transportType, isAvailable: $isAvailable, docId: $docId, goBack: $goBack)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TransportRequest &&
            const DeepCollectionEquality()
                .equals(other.seatsAvailable, seatsAvailable) &&
            const DeepCollectionEquality()
                .equals(other.transportType, transportType) &&
            const DeepCollectionEquality()
                .equals(other.isAvailable, isAvailable) &&
            const DeepCollectionEquality().equals(other.docId, docId) &&
            const DeepCollectionEquality().equals(other.goBack, goBack));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(seatsAvailable),
      const DeepCollectionEquality().hash(transportType),
      const DeepCollectionEquality().hash(isAvailable),
      const DeepCollectionEquality().hash(docId),
      const DeepCollectionEquality().hash(goBack));

  @JsonKey(ignore: true)
  @override
  _$TransportRequestCopyWith<_TransportRequest> get copyWith =>
      __$TransportRequestCopyWithImpl<_TransportRequest>(this, _$identity);
}

abstract class _TransportRequest implements TransportRequest {
  const factory _TransportRequest(
      {int? seatsAvailable,
      TransportTypeModel? transportType,
      bool? isAvailable,
      String? docId,
      bool goBack}) = _$_TransportRequest;

  @override
  int? get seatsAvailable;
  @override
  TransportTypeModel? get transportType;
  @override
  bool? get isAvailable;
  @override
  String? get docId;
  @override
  bool get goBack;
  @override
  @JsonKey(ignore: true)
  _$TransportRequestCopyWith<_TransportRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
