// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'root_router_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RootRouterStateTearOff {
  const _$RootRouterStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Unauthenticated unauthenticated() {
    return const _Unauthenticated();
  }

  _Home home({UserModel? user, bool viewProfile = false}) {
    return _Home(
      user: user,
      viewProfile: viewProfile,
    );
  }

  _Transport transport(
      [RouterTransportState stateConfig = const RouterTransportState()]) {
    return _Transport(
      stateConfig,
    );
  }

  _Housing housing(
      [RouterHousingState stateConfig = const RouterHousingState()]) {
    return _Housing(
      stateConfig,
    );
  }

  _Tickets tickets(
      [RouterTicketsState stateConfig = const RouterTicketsState()]) {
    return _Tickets(
      stateConfig,
    );
  }

  _Register register() {
    return const _Register();
  }

  _Unknown unknown() {
    return const _Unknown();
  }
}

/// @nodoc
const $RootRouterState = _$RootRouterStateTearOff();

/// @nodoc
mixin _$RootRouterState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unauthenticated,
    required TResult Function(UserModel? user, bool viewProfile) home,
    required TResult Function(RouterTransportState stateConfig) transport,
    required TResult Function(RouterHousingState stateConfig) housing,
    required TResult Function(RouterTicketsState stateConfig) tickets,
    required TResult Function() register,
    required TResult Function() unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function(UserModel? user, bool viewProfile)? home,
    TResult Function(RouterTransportState stateConfig)? transport,
    TResult Function(RouterHousingState stateConfig)? housing,
    TResult Function(RouterTicketsState stateConfig)? tickets,
    TResult Function()? register,
    TResult Function()? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function(UserModel? user, bool viewProfile)? home,
    TResult Function(RouterTransportState stateConfig)? transport,
    TResult Function(RouterHousingState stateConfig)? housing,
    TResult Function(RouterTicketsState stateConfig)? tickets,
    TResult Function()? register,
    TResult Function()? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Home value) home,
    required TResult Function(_Transport value) transport,
    required TResult Function(_Housing value) housing,
    required TResult Function(_Tickets value) tickets,
    required TResult Function(_Register value) register,
    required TResult Function(_Unknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Home value)? home,
    TResult Function(_Transport value)? transport,
    TResult Function(_Housing value)? housing,
    TResult Function(_Tickets value)? tickets,
    TResult Function(_Register value)? register,
    TResult Function(_Unknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Home value)? home,
    TResult Function(_Transport value)? transport,
    TResult Function(_Housing value)? housing,
    TResult Function(_Tickets value)? tickets,
    TResult Function(_Register value)? register,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RootRouterStateCopyWith<$Res> {
  factory $RootRouterStateCopyWith(
          RootRouterState value, $Res Function(RootRouterState) then) =
      _$RootRouterStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$RootRouterStateCopyWithImpl<$Res>
    implements $RootRouterStateCopyWith<$Res> {
  _$RootRouterStateCopyWithImpl(this._value, this._then);

  final RootRouterState _value;
  // ignore: unused_field
  final $Res Function(RootRouterState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$RootRouterStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial() : super._();

  @override
  String toString() {
    return 'RootRouterState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unauthenticated,
    required TResult Function(UserModel? user, bool viewProfile) home,
    required TResult Function(RouterTransportState stateConfig) transport,
    required TResult Function(RouterHousingState stateConfig) housing,
    required TResult Function(RouterTicketsState stateConfig) tickets,
    required TResult Function() register,
    required TResult Function() unknown,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function(UserModel? user, bool viewProfile)? home,
    TResult Function(RouterTransportState stateConfig)? transport,
    TResult Function(RouterHousingState stateConfig)? housing,
    TResult Function(RouterTicketsState stateConfig)? tickets,
    TResult Function()? register,
    TResult Function()? unknown,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function(UserModel? user, bool viewProfile)? home,
    TResult Function(RouterTransportState stateConfig)? transport,
    TResult Function(RouterHousingState stateConfig)? housing,
    TResult Function(RouterTicketsState stateConfig)? tickets,
    TResult Function()? register,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Home value) home,
    required TResult Function(_Transport value) transport,
    required TResult Function(_Housing value) housing,
    required TResult Function(_Tickets value) tickets,
    required TResult Function(_Register value) register,
    required TResult Function(_Unknown value) unknown,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Home value)? home,
    TResult Function(_Transport value)? transport,
    TResult Function(_Housing value)? housing,
    TResult Function(_Tickets value)? tickets,
    TResult Function(_Register value)? register,
    TResult Function(_Unknown value)? unknown,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Home value)? home,
    TResult Function(_Transport value)? transport,
    TResult Function(_Housing value)? housing,
    TResult Function(_Tickets value)? tickets,
    TResult Function(_Register value)? register,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends RootRouterState {
  const factory _Initial() = _$_Initial;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$UnauthenticatedCopyWith<$Res> {
  factory _$UnauthenticatedCopyWith(
          _Unauthenticated value, $Res Function(_Unauthenticated) then) =
      __$UnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$UnauthenticatedCopyWithImpl<$Res>
    extends _$RootRouterStateCopyWithImpl<$Res>
    implements _$UnauthenticatedCopyWith<$Res> {
  __$UnauthenticatedCopyWithImpl(
      _Unauthenticated _value, $Res Function(_Unauthenticated) _then)
      : super(_value, (v) => _then(v as _Unauthenticated));

  @override
  _Unauthenticated get _value => super._value as _Unauthenticated;
}

/// @nodoc

class _$_Unauthenticated extends _Unauthenticated {
  const _$_Unauthenticated() : super._();

  @override
  String toString() {
    return 'RootRouterState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unauthenticated,
    required TResult Function(UserModel? user, bool viewProfile) home,
    required TResult Function(RouterTransportState stateConfig) transport,
    required TResult Function(RouterHousingState stateConfig) housing,
    required TResult Function(RouterTicketsState stateConfig) tickets,
    required TResult Function() register,
    required TResult Function() unknown,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function(UserModel? user, bool viewProfile)? home,
    TResult Function(RouterTransportState stateConfig)? transport,
    TResult Function(RouterHousingState stateConfig)? housing,
    TResult Function(RouterTicketsState stateConfig)? tickets,
    TResult Function()? register,
    TResult Function()? unknown,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function(UserModel? user, bool viewProfile)? home,
    TResult Function(RouterTransportState stateConfig)? transport,
    TResult Function(RouterHousingState stateConfig)? housing,
    TResult Function(RouterTicketsState stateConfig)? tickets,
    TResult Function()? register,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Home value) home,
    required TResult Function(_Transport value) transport,
    required TResult Function(_Housing value) housing,
    required TResult Function(_Tickets value) tickets,
    required TResult Function(_Register value) register,
    required TResult Function(_Unknown value) unknown,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Home value)? home,
    TResult Function(_Transport value)? transport,
    TResult Function(_Housing value)? housing,
    TResult Function(_Tickets value)? tickets,
    TResult Function(_Register value)? register,
    TResult Function(_Unknown value)? unknown,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Home value)? home,
    TResult Function(_Transport value)? transport,
    TResult Function(_Housing value)? housing,
    TResult Function(_Tickets value)? tickets,
    TResult Function(_Register value)? register,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _Unauthenticated extends RootRouterState {
  const factory _Unauthenticated() = _$_Unauthenticated;
  const _Unauthenticated._() : super._();
}

/// @nodoc
abstract class _$HomeCopyWith<$Res> {
  factory _$HomeCopyWith(_Home value, $Res Function(_Home) then) =
      __$HomeCopyWithImpl<$Res>;
  $Res call({UserModel? user, bool viewProfile});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$HomeCopyWithImpl<$Res> extends _$RootRouterStateCopyWithImpl<$Res>
    implements _$HomeCopyWith<$Res> {
  __$HomeCopyWithImpl(_Home _value, $Res Function(_Home) _then)
      : super(_value, (v) => _then(v as _Home));

  @override
  _Home get _value => super._value as _Home;

  @override
  $Res call({
    Object? user = freezed,
    Object? viewProfile = freezed,
  }) {
    return _then(_Home(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      viewProfile: viewProfile == freezed
          ? _value.viewProfile
          : viewProfile // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_Home extends _Home {
  const _$_Home({this.user, this.viewProfile = false}) : super._();

  @override
  final UserModel? user;
  @JsonKey()
  @override
  final bool viewProfile;

  @override
  String toString() {
    return 'RootRouterState.home(user: $user, viewProfile: $viewProfile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Home &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality()
                .equals(other.viewProfile, viewProfile));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(viewProfile));

  @JsonKey(ignore: true)
  @override
  _$HomeCopyWith<_Home> get copyWith =>
      __$HomeCopyWithImpl<_Home>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unauthenticated,
    required TResult Function(UserModel? user, bool viewProfile) home,
    required TResult Function(RouterTransportState stateConfig) transport,
    required TResult Function(RouterHousingState stateConfig) housing,
    required TResult Function(RouterTicketsState stateConfig) tickets,
    required TResult Function() register,
    required TResult Function() unknown,
  }) {
    return home(user, viewProfile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function(UserModel? user, bool viewProfile)? home,
    TResult Function(RouterTransportState stateConfig)? transport,
    TResult Function(RouterHousingState stateConfig)? housing,
    TResult Function(RouterTicketsState stateConfig)? tickets,
    TResult Function()? register,
    TResult Function()? unknown,
  }) {
    return home?.call(user, viewProfile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function(UserModel? user, bool viewProfile)? home,
    TResult Function(RouterTransportState stateConfig)? transport,
    TResult Function(RouterHousingState stateConfig)? housing,
    TResult Function(RouterTicketsState stateConfig)? tickets,
    TResult Function()? register,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (home != null) {
      return home(user, viewProfile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Home value) home,
    required TResult Function(_Transport value) transport,
    required TResult Function(_Housing value) housing,
    required TResult Function(_Tickets value) tickets,
    required TResult Function(_Register value) register,
    required TResult Function(_Unknown value) unknown,
  }) {
    return home(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Home value)? home,
    TResult Function(_Transport value)? transport,
    TResult Function(_Housing value)? housing,
    TResult Function(_Tickets value)? tickets,
    TResult Function(_Register value)? register,
    TResult Function(_Unknown value)? unknown,
  }) {
    return home?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Home value)? home,
    TResult Function(_Transport value)? transport,
    TResult Function(_Housing value)? housing,
    TResult Function(_Tickets value)? tickets,
    TResult Function(_Register value)? register,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (home != null) {
      return home(this);
    }
    return orElse();
  }
}

abstract class _Home extends RootRouterState {
  const factory _Home({UserModel? user, bool viewProfile}) = _$_Home;
  const _Home._() : super._();

  UserModel? get user;
  bool get viewProfile;
  @JsonKey(ignore: true)
  _$HomeCopyWith<_Home> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$TransportCopyWith<$Res> {
  factory _$TransportCopyWith(
          _Transport value, $Res Function(_Transport) then) =
      __$TransportCopyWithImpl<$Res>;
  $Res call({RouterTransportState stateConfig});

  $RouterTransportStateCopyWith<$Res> get stateConfig;
}

/// @nodoc
class __$TransportCopyWithImpl<$Res> extends _$RootRouterStateCopyWithImpl<$Res>
    implements _$TransportCopyWith<$Res> {
  __$TransportCopyWithImpl(_Transport _value, $Res Function(_Transport) _then)
      : super(_value, (v) => _then(v as _Transport));

  @override
  _Transport get _value => super._value as _Transport;

  @override
  $Res call({
    Object? stateConfig = freezed,
  }) {
    return _then(_Transport(
      stateConfig == freezed
          ? _value.stateConfig
          : stateConfig // ignore: cast_nullable_to_non_nullable
              as RouterTransportState,
    ));
  }

  @override
  $RouterTransportStateCopyWith<$Res> get stateConfig {
    return $RouterTransportStateCopyWith<$Res>(_value.stateConfig, (value) {
      return _then(_value.copyWith(stateConfig: value));
    });
  }
}

/// @nodoc

class _$_Transport extends _Transport {
  const _$_Transport([this.stateConfig = const RouterTransportState()])
      : super._();

  @JsonKey()
  @override
  final RouterTransportState stateConfig;

  @override
  String toString() {
    return 'RootRouterState.transport(stateConfig: $stateConfig)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Transport &&
            const DeepCollectionEquality()
                .equals(other.stateConfig, stateConfig));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(stateConfig));

  @JsonKey(ignore: true)
  @override
  _$TransportCopyWith<_Transport> get copyWith =>
      __$TransportCopyWithImpl<_Transport>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unauthenticated,
    required TResult Function(UserModel? user, bool viewProfile) home,
    required TResult Function(RouterTransportState stateConfig) transport,
    required TResult Function(RouterHousingState stateConfig) housing,
    required TResult Function(RouterTicketsState stateConfig) tickets,
    required TResult Function() register,
    required TResult Function() unknown,
  }) {
    return transport(stateConfig);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function(UserModel? user, bool viewProfile)? home,
    TResult Function(RouterTransportState stateConfig)? transport,
    TResult Function(RouterHousingState stateConfig)? housing,
    TResult Function(RouterTicketsState stateConfig)? tickets,
    TResult Function()? register,
    TResult Function()? unknown,
  }) {
    return transport?.call(stateConfig);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function(UserModel? user, bool viewProfile)? home,
    TResult Function(RouterTransportState stateConfig)? transport,
    TResult Function(RouterHousingState stateConfig)? housing,
    TResult Function(RouterTicketsState stateConfig)? tickets,
    TResult Function()? register,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (transport != null) {
      return transport(stateConfig);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Home value) home,
    required TResult Function(_Transport value) transport,
    required TResult Function(_Housing value) housing,
    required TResult Function(_Tickets value) tickets,
    required TResult Function(_Register value) register,
    required TResult Function(_Unknown value) unknown,
  }) {
    return transport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Home value)? home,
    TResult Function(_Transport value)? transport,
    TResult Function(_Housing value)? housing,
    TResult Function(_Tickets value)? tickets,
    TResult Function(_Register value)? register,
    TResult Function(_Unknown value)? unknown,
  }) {
    return transport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Home value)? home,
    TResult Function(_Transport value)? transport,
    TResult Function(_Housing value)? housing,
    TResult Function(_Tickets value)? tickets,
    TResult Function(_Register value)? register,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (transport != null) {
      return transport(this);
    }
    return orElse();
  }
}

abstract class _Transport extends RootRouterState {
  const factory _Transport([RouterTransportState stateConfig]) = _$_Transport;
  const _Transport._() : super._();

  RouterTransportState get stateConfig;
  @JsonKey(ignore: true)
  _$TransportCopyWith<_Transport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$HousingCopyWith<$Res> {
  factory _$HousingCopyWith(_Housing value, $Res Function(_Housing) then) =
      __$HousingCopyWithImpl<$Res>;
  $Res call({RouterHousingState stateConfig});

  $RouterHousingStateCopyWith<$Res> get stateConfig;
}

/// @nodoc
class __$HousingCopyWithImpl<$Res> extends _$RootRouterStateCopyWithImpl<$Res>
    implements _$HousingCopyWith<$Res> {
  __$HousingCopyWithImpl(_Housing _value, $Res Function(_Housing) _then)
      : super(_value, (v) => _then(v as _Housing));

  @override
  _Housing get _value => super._value as _Housing;

  @override
  $Res call({
    Object? stateConfig = freezed,
  }) {
    return _then(_Housing(
      stateConfig == freezed
          ? _value.stateConfig
          : stateConfig // ignore: cast_nullable_to_non_nullable
              as RouterHousingState,
    ));
  }

  @override
  $RouterHousingStateCopyWith<$Res> get stateConfig {
    return $RouterHousingStateCopyWith<$Res>(_value.stateConfig, (value) {
      return _then(_value.copyWith(stateConfig: value));
    });
  }
}

/// @nodoc

class _$_Housing extends _Housing {
  const _$_Housing([this.stateConfig = const RouterHousingState()]) : super._();

  @JsonKey()
  @override
  final RouterHousingState stateConfig;

  @override
  String toString() {
    return 'RootRouterState.housing(stateConfig: $stateConfig)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Housing &&
            const DeepCollectionEquality()
                .equals(other.stateConfig, stateConfig));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(stateConfig));

  @JsonKey(ignore: true)
  @override
  _$HousingCopyWith<_Housing> get copyWith =>
      __$HousingCopyWithImpl<_Housing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unauthenticated,
    required TResult Function(UserModel? user, bool viewProfile) home,
    required TResult Function(RouterTransportState stateConfig) transport,
    required TResult Function(RouterHousingState stateConfig) housing,
    required TResult Function(RouterTicketsState stateConfig) tickets,
    required TResult Function() register,
    required TResult Function() unknown,
  }) {
    return housing(stateConfig);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function(UserModel? user, bool viewProfile)? home,
    TResult Function(RouterTransportState stateConfig)? transport,
    TResult Function(RouterHousingState stateConfig)? housing,
    TResult Function(RouterTicketsState stateConfig)? tickets,
    TResult Function()? register,
    TResult Function()? unknown,
  }) {
    return housing?.call(stateConfig);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function(UserModel? user, bool viewProfile)? home,
    TResult Function(RouterTransportState stateConfig)? transport,
    TResult Function(RouterHousingState stateConfig)? housing,
    TResult Function(RouterTicketsState stateConfig)? tickets,
    TResult Function()? register,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (housing != null) {
      return housing(stateConfig);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Home value) home,
    required TResult Function(_Transport value) transport,
    required TResult Function(_Housing value) housing,
    required TResult Function(_Tickets value) tickets,
    required TResult Function(_Register value) register,
    required TResult Function(_Unknown value) unknown,
  }) {
    return housing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Home value)? home,
    TResult Function(_Transport value)? transport,
    TResult Function(_Housing value)? housing,
    TResult Function(_Tickets value)? tickets,
    TResult Function(_Register value)? register,
    TResult Function(_Unknown value)? unknown,
  }) {
    return housing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Home value)? home,
    TResult Function(_Transport value)? transport,
    TResult Function(_Housing value)? housing,
    TResult Function(_Tickets value)? tickets,
    TResult Function(_Register value)? register,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (housing != null) {
      return housing(this);
    }
    return orElse();
  }
}

abstract class _Housing extends RootRouterState {
  const factory _Housing([RouterHousingState stateConfig]) = _$_Housing;
  const _Housing._() : super._();

  RouterHousingState get stateConfig;
  @JsonKey(ignore: true)
  _$HousingCopyWith<_Housing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$TicketsCopyWith<$Res> {
  factory _$TicketsCopyWith(_Tickets value, $Res Function(_Tickets) then) =
      __$TicketsCopyWithImpl<$Res>;
  $Res call({RouterTicketsState stateConfig});

  $RouterTicketsStateCopyWith<$Res> get stateConfig;
}

/// @nodoc
class __$TicketsCopyWithImpl<$Res> extends _$RootRouterStateCopyWithImpl<$Res>
    implements _$TicketsCopyWith<$Res> {
  __$TicketsCopyWithImpl(_Tickets _value, $Res Function(_Tickets) _then)
      : super(_value, (v) => _then(v as _Tickets));

  @override
  _Tickets get _value => super._value as _Tickets;

  @override
  $Res call({
    Object? stateConfig = freezed,
  }) {
    return _then(_Tickets(
      stateConfig == freezed
          ? _value.stateConfig
          : stateConfig // ignore: cast_nullable_to_non_nullable
              as RouterTicketsState,
    ));
  }

  @override
  $RouterTicketsStateCopyWith<$Res> get stateConfig {
    return $RouterTicketsStateCopyWith<$Res>(_value.stateConfig, (value) {
      return _then(_value.copyWith(stateConfig: value));
    });
  }
}

/// @nodoc

class _$_Tickets extends _Tickets {
  const _$_Tickets([this.stateConfig = const RouterTicketsState()]) : super._();

  @JsonKey()
  @override
  final RouterTicketsState stateConfig;

  @override
  String toString() {
    return 'RootRouterState.tickets(stateConfig: $stateConfig)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Tickets &&
            const DeepCollectionEquality()
                .equals(other.stateConfig, stateConfig));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(stateConfig));

  @JsonKey(ignore: true)
  @override
  _$TicketsCopyWith<_Tickets> get copyWith =>
      __$TicketsCopyWithImpl<_Tickets>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unauthenticated,
    required TResult Function(UserModel? user, bool viewProfile) home,
    required TResult Function(RouterTransportState stateConfig) transport,
    required TResult Function(RouterHousingState stateConfig) housing,
    required TResult Function(RouterTicketsState stateConfig) tickets,
    required TResult Function() register,
    required TResult Function() unknown,
  }) {
    return tickets(stateConfig);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function(UserModel? user, bool viewProfile)? home,
    TResult Function(RouterTransportState stateConfig)? transport,
    TResult Function(RouterHousingState stateConfig)? housing,
    TResult Function(RouterTicketsState stateConfig)? tickets,
    TResult Function()? register,
    TResult Function()? unknown,
  }) {
    return tickets?.call(stateConfig);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function(UserModel? user, bool viewProfile)? home,
    TResult Function(RouterTransportState stateConfig)? transport,
    TResult Function(RouterHousingState stateConfig)? housing,
    TResult Function(RouterTicketsState stateConfig)? tickets,
    TResult Function()? register,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (tickets != null) {
      return tickets(stateConfig);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Home value) home,
    required TResult Function(_Transport value) transport,
    required TResult Function(_Housing value) housing,
    required TResult Function(_Tickets value) tickets,
    required TResult Function(_Register value) register,
    required TResult Function(_Unknown value) unknown,
  }) {
    return tickets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Home value)? home,
    TResult Function(_Transport value)? transport,
    TResult Function(_Housing value)? housing,
    TResult Function(_Tickets value)? tickets,
    TResult Function(_Register value)? register,
    TResult Function(_Unknown value)? unknown,
  }) {
    return tickets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Home value)? home,
    TResult Function(_Transport value)? transport,
    TResult Function(_Housing value)? housing,
    TResult Function(_Tickets value)? tickets,
    TResult Function(_Register value)? register,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (tickets != null) {
      return tickets(this);
    }
    return orElse();
  }
}

abstract class _Tickets extends RootRouterState {
  const factory _Tickets([RouterTicketsState stateConfig]) = _$_Tickets;
  const _Tickets._() : super._();

  RouterTicketsState get stateConfig;
  @JsonKey(ignore: true)
  _$TicketsCopyWith<_Tickets> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RegisterCopyWith<$Res> {
  factory _$RegisterCopyWith(_Register value, $Res Function(_Register) then) =
      __$RegisterCopyWithImpl<$Res>;
}

/// @nodoc
class __$RegisterCopyWithImpl<$Res> extends _$RootRouterStateCopyWithImpl<$Res>
    implements _$RegisterCopyWith<$Res> {
  __$RegisterCopyWithImpl(_Register _value, $Res Function(_Register) _then)
      : super(_value, (v) => _then(v as _Register));

  @override
  _Register get _value => super._value as _Register;
}

/// @nodoc

class _$_Register extends _Register {
  const _$_Register() : super._();

  @override
  String toString() {
    return 'RootRouterState.register()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Register);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unauthenticated,
    required TResult Function(UserModel? user, bool viewProfile) home,
    required TResult Function(RouterTransportState stateConfig) transport,
    required TResult Function(RouterHousingState stateConfig) housing,
    required TResult Function(RouterTicketsState stateConfig) tickets,
    required TResult Function() register,
    required TResult Function() unknown,
  }) {
    return register();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function(UserModel? user, bool viewProfile)? home,
    TResult Function(RouterTransportState stateConfig)? transport,
    TResult Function(RouterHousingState stateConfig)? housing,
    TResult Function(RouterTicketsState stateConfig)? tickets,
    TResult Function()? register,
    TResult Function()? unknown,
  }) {
    return register?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function(UserModel? user, bool viewProfile)? home,
    TResult Function(RouterTransportState stateConfig)? transport,
    TResult Function(RouterHousingState stateConfig)? housing,
    TResult Function(RouterTicketsState stateConfig)? tickets,
    TResult Function()? register,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Home value) home,
    required TResult Function(_Transport value) transport,
    required TResult Function(_Housing value) housing,
    required TResult Function(_Tickets value) tickets,
    required TResult Function(_Register value) register,
    required TResult Function(_Unknown value) unknown,
  }) {
    return register(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Home value)? home,
    TResult Function(_Transport value)? transport,
    TResult Function(_Housing value)? housing,
    TResult Function(_Tickets value)? tickets,
    TResult Function(_Register value)? register,
    TResult Function(_Unknown value)? unknown,
  }) {
    return register?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Home value)? home,
    TResult Function(_Transport value)? transport,
    TResult Function(_Housing value)? housing,
    TResult Function(_Tickets value)? tickets,
    TResult Function(_Register value)? register,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(this);
    }
    return orElse();
  }
}

abstract class _Register extends RootRouterState {
  const factory _Register() = _$_Register;
  const _Register._() : super._();
}

/// @nodoc
abstract class _$UnknownCopyWith<$Res> {
  factory _$UnknownCopyWith(_Unknown value, $Res Function(_Unknown) then) =
      __$UnknownCopyWithImpl<$Res>;
}

/// @nodoc
class __$UnknownCopyWithImpl<$Res> extends _$RootRouterStateCopyWithImpl<$Res>
    implements _$UnknownCopyWith<$Res> {
  __$UnknownCopyWithImpl(_Unknown _value, $Res Function(_Unknown) _then)
      : super(_value, (v) => _then(v as _Unknown));

  @override
  _Unknown get _value => super._value as _Unknown;
}

/// @nodoc

class _$_Unknown extends _Unknown {
  const _$_Unknown() : super._();

  @override
  String toString() {
    return 'RootRouterState.unknown()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Unknown);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unauthenticated,
    required TResult Function(UserModel? user, bool viewProfile) home,
    required TResult Function(RouterTransportState stateConfig) transport,
    required TResult Function(RouterHousingState stateConfig) housing,
    required TResult Function(RouterTicketsState stateConfig) tickets,
    required TResult Function() register,
    required TResult Function() unknown,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function(UserModel? user, bool viewProfile)? home,
    TResult Function(RouterTransportState stateConfig)? transport,
    TResult Function(RouterHousingState stateConfig)? housing,
    TResult Function(RouterTicketsState stateConfig)? tickets,
    TResult Function()? register,
    TResult Function()? unknown,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unauthenticated,
    TResult Function(UserModel? user, bool viewProfile)? home,
    TResult Function(RouterTransportState stateConfig)? transport,
    TResult Function(RouterHousingState stateConfig)? housing,
    TResult Function(RouterTicketsState stateConfig)? tickets,
    TResult Function()? register,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_Home value) home,
    required TResult Function(_Transport value) transport,
    required TResult Function(_Housing value) housing,
    required TResult Function(_Tickets value) tickets,
    required TResult Function(_Register value) register,
    required TResult Function(_Unknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Home value)? home,
    TResult Function(_Transport value)? transport,
    TResult Function(_Housing value)? housing,
    TResult Function(_Tickets value)? tickets,
    TResult Function(_Register value)? register,
    TResult Function(_Unknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_Home value)? home,
    TResult Function(_Transport value)? transport,
    TResult Function(_Housing value)? housing,
    TResult Function(_Tickets value)? tickets,
    TResult Function(_Register value)? register,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _Unknown extends RootRouterState {
  const factory _Unknown() = _$_Unknown;
  const _Unknown._() : super._();
}
