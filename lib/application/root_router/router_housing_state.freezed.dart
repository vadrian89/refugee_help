// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'router_housing_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RouterHousingStateTearOff {
  const _$RouterHousingStateTearOff();

  _RouterHousingState call(
      {String? id, bool add = false, bool modalVisible = false}) {
    return _RouterHousingState(
      id: id,
      add: add,
      modalVisible: modalVisible,
    );
  }
}

/// @nodoc
const $RouterHousingState = _$RouterHousingStateTearOff();

/// @nodoc
mixin _$RouterHousingState {
  String? get id => throw _privateConstructorUsedError;
  bool get add => throw _privateConstructorUsedError;
  bool get modalVisible => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RouterHousingStateCopyWith<RouterHousingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouterHousingStateCopyWith<$Res> {
  factory $RouterHousingStateCopyWith(
          RouterHousingState value, $Res Function(RouterHousingState) then) =
      _$RouterHousingStateCopyWithImpl<$Res>;
  $Res call({String? id, bool add, bool modalVisible});
}

/// @nodoc
class _$RouterHousingStateCopyWithImpl<$Res>
    implements $RouterHousingStateCopyWith<$Res> {
  _$RouterHousingStateCopyWithImpl(this._value, this._then);

  final RouterHousingState _value;
  // ignore: unused_field
  final $Res Function(RouterHousingState) _then;

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
abstract class _$RouterHousingStateCopyWith<$Res>
    implements $RouterHousingStateCopyWith<$Res> {
  factory _$RouterHousingStateCopyWith(
          _RouterHousingState value, $Res Function(_RouterHousingState) then) =
      __$RouterHousingStateCopyWithImpl<$Res>;
  @override
  $Res call({String? id, bool add, bool modalVisible});
}

/// @nodoc
class __$RouterHousingStateCopyWithImpl<$Res>
    extends _$RouterHousingStateCopyWithImpl<$Res>
    implements _$RouterHousingStateCopyWith<$Res> {
  __$RouterHousingStateCopyWithImpl(
      _RouterHousingState _value, $Res Function(_RouterHousingState) _then)
      : super(_value, (v) => _then(v as _RouterHousingState));

  @override
  _RouterHousingState get _value => super._value as _RouterHousingState;

  @override
  $Res call({
    Object? id = freezed,
    Object? add = freezed,
    Object? modalVisible = freezed,
  }) {
    return _then(_RouterHousingState(
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

class _$_RouterHousingState extends _RouterHousingState {
  const _$_RouterHousingState(
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
    return 'RouterHousingState(id: $id, add: $add, modalVisible: $modalVisible)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RouterHousingState &&
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
  _$RouterHousingStateCopyWith<_RouterHousingState> get copyWith =>
      __$RouterHousingStateCopyWithImpl<_RouterHousingState>(this, _$identity);
}

abstract class _RouterHousingState extends RouterHousingState {
  const factory _RouterHousingState({String? id, bool add, bool modalVisible}) =
      _$_RouterHousingState;
  const _RouterHousingState._() : super._();

  @override
  String? get id;
  @override
  bool get add;
  @override
  bool get modalVisible;
  @override
  @JsonKey(ignore: true)
  _$RouterHousingStateCopyWith<_RouterHousingState> get copyWith =>
      throw _privateConstructorUsedError;
}
