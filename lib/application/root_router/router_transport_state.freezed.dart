// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'router_transport_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RouterTransportStateTearOff {
  const _$RouterTransportStateTearOff();

  _RouterTransportState call(
      {String? id, bool add = false, bool modalVisible = false}) {
    return _RouterTransportState(
      id: id,
      add: add,
      modalVisible: modalVisible,
    );
  }
}

/// @nodoc
const $RouterTransportState = _$RouterTransportStateTearOff();

/// @nodoc
mixin _$RouterTransportState {
  String? get id => throw _privateConstructorUsedError;
  bool get add => throw _privateConstructorUsedError;
  bool get modalVisible => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RouterTransportStateCopyWith<RouterTransportState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouterTransportStateCopyWith<$Res> {
  factory $RouterTransportStateCopyWith(RouterTransportState value,
          $Res Function(RouterTransportState) then) =
      _$RouterTransportStateCopyWithImpl<$Res>;
  $Res call({String? id, bool add, bool modalVisible});
}

/// @nodoc
class _$RouterTransportStateCopyWithImpl<$Res>
    implements $RouterTransportStateCopyWith<$Res> {
  _$RouterTransportStateCopyWithImpl(this._value, this._then);

  final RouterTransportState _value;
  // ignore: unused_field
  final $Res Function(RouterTransportState) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? add = freezed,
    Object? modalVisible = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      add: add == freezed
          ? _value.add
          : add // ignore: cast_nullable_to_non_nullable
              as bool,
      modalVisible: modalVisible == freezed
          ? _value.modalVisible
          : modalVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$RouterTransportStateCopyWith<$Res>
    implements $RouterTransportStateCopyWith<$Res> {
  factory _$RouterTransportStateCopyWith(_RouterTransportState value,
          $Res Function(_RouterTransportState) then) =
      __$RouterTransportStateCopyWithImpl<$Res>;
  @override
  $Res call({String? id, bool add, bool modalVisible});
}

/// @nodoc
class __$RouterTransportStateCopyWithImpl<$Res>
    extends _$RouterTransportStateCopyWithImpl<$Res>
    implements _$RouterTransportStateCopyWith<$Res> {
  __$RouterTransportStateCopyWithImpl(
      _RouterTransportState _value, $Res Function(_RouterTransportState) _then)
      : super(_value, (v) => _then(v as _RouterTransportState));

  @override
  _RouterTransportState get _value => super._value as _RouterTransportState;

  @override
  $Res call({
    Object? id = freezed,
    Object? add = freezed,
    Object? modalVisible = freezed,
  }) {
    return _then(_RouterTransportState(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      add: add == freezed
          ? _value.add
          : add // ignore: cast_nullable_to_non_nullable
              as bool,
      modalVisible: modalVisible == freezed
          ? _value.modalVisible
          : modalVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_RouterTransportState extends _RouterTransportState {
  const _$_RouterTransportState(
      {this.id, this.add = false, this.modalVisible = false})
      : super._();

  @override
  final String? id;
  @JsonKey()
  @override
  final bool add;
  @JsonKey()
  @override
  final bool modalVisible;

  @override
  String toString() {
    return 'RouterTransportState(id: $id, add: $add, modalVisible: $modalVisible)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouterTransportState &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.add, add) &&
            const DeepCollectionEquality()
                .equals(other.modalVisible, modalVisible));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(add),
      const DeepCollectionEquality().hash(modalVisible));

  @JsonKey(ignore: true)
  @override
  _$RouterTransportStateCopyWith<_RouterTransportState> get copyWith =>
      __$RouterTransportStateCopyWithImpl<_RouterTransportState>(
          this, _$identity);
}

abstract class _RouterTransportState extends RouterTransportState {
  const factory _RouterTransportState(
      {String? id, bool add, bool modalVisible}) = _$_RouterTransportState;
  const _RouterTransportState._() : super._();

  @override
  String? get id;
  @override
  bool get add;
  @override
  bool get modalVisible;
  @override
  @JsonKey(ignore: true)
  _$RouterTransportStateCopyWith<_RouterTransportState> get copyWith =>
      throw _privateConstructorUsedError;
}
