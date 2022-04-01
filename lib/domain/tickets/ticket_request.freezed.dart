// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ticket_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TicketRequestTearOff {
  const _$TicketRequestTearOff();

  _TicketRequest call({String? docId, bool goBack = false}) {
    return _TicketRequest(
      docId: docId,
      goBack: goBack,
    );
  }
}

/// @nodoc
const $TicketRequest = _$TicketRequestTearOff();

/// @nodoc
mixin _$TicketRequest {
  String? get docId => throw _privateConstructorUsedError;
  bool get goBack => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TicketRequestCopyWith<TicketRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketRequestCopyWith<$Res> {
  factory $TicketRequestCopyWith(
          TicketRequest value, $Res Function(TicketRequest) then) =
      _$TicketRequestCopyWithImpl<$Res>;
  $Res call({String? docId, bool goBack});
}

/// @nodoc
class _$TicketRequestCopyWithImpl<$Res>
    implements $TicketRequestCopyWith<$Res> {
  _$TicketRequestCopyWithImpl(this._value, this._then);

  final TicketRequest _value;
  // ignore: unused_field
  final $Res Function(TicketRequest) _then;

  @override
  $Res call({
    Object? docId = freezed,
    Object? goBack = freezed,
  }) {
    return _then(_value.copyWith(
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
abstract class _$TicketRequestCopyWith<$Res>
    implements $TicketRequestCopyWith<$Res> {
  factory _$TicketRequestCopyWith(
          _TicketRequest value, $Res Function(_TicketRequest) then) =
      __$TicketRequestCopyWithImpl<$Res>;
  @override
  $Res call({String? docId, bool goBack});
}

/// @nodoc
class __$TicketRequestCopyWithImpl<$Res>
    extends _$TicketRequestCopyWithImpl<$Res>
    implements _$TicketRequestCopyWith<$Res> {
  __$TicketRequestCopyWithImpl(
      _TicketRequest _value, $Res Function(_TicketRequest) _then)
      : super(_value, (v) => _then(v as _TicketRequest));

  @override
  _TicketRequest get _value => super._value as _TicketRequest;

  @override
  $Res call({
    Object? docId = freezed,
    Object? goBack = freezed,
  }) {
    return _then(_TicketRequest(
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

class _$_TicketRequest implements _TicketRequest {
  const _$_TicketRequest({this.docId, this.goBack = false});

  @override
  final String? docId;
  @JsonKey()
  @override
  final bool goBack;

  @override
  String toString() {
    return 'TicketRequest(docId: $docId, goBack: $goBack)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TicketRequest &&
            const DeepCollectionEquality().equals(other.docId, docId) &&
            const DeepCollectionEquality().equals(other.goBack, goBack));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(docId),
      const DeepCollectionEquality().hash(goBack));

  @JsonKey(ignore: true)
  @override
  _$TicketRequestCopyWith<_TicketRequest> get copyWith =>
      __$TicketRequestCopyWithImpl<_TicketRequest>(this, _$identity);
}

abstract class _TicketRequest implements TicketRequest {
  const factory _TicketRequest({String? docId, bool goBack}) = _$_TicketRequest;

  @override
  String? get docId;
  @override
  bool get goBack;
  @override
  @JsonKey(ignore: true)
  _$TicketRequestCopyWith<_TicketRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
