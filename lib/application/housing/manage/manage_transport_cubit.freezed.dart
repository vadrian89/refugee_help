// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'manage_transport_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ManageTransportStateTearOff {
  const _$ManageTransportStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _View view(
      {required TransportModel transport,
      bool? showUserInfo = false,
      bool? canUpdate = false}) {
    return _View(
      transport: transport,
      showUserInfo: showUserInfo,
      canUpdate: canUpdate,
    );
  }

  _Edit edit(TransportModel transport) {
    return _Edit(
      transport,
    );
  }

  _Loading loading(String message) {
    return _Loading(
      message,
    );
  }

  _Success success({String? message, bool popScreen = false}) {
    return _Success(
      message: message,
      popScreen: popScreen,
    );
  }

  _Failure failure(String message) {
    return _Failure(
      message,
    );
  }
}

/// @nodoc
const $ManageTransportState = _$ManageTransportStateTearOff();

/// @nodoc
mixin _$ManageTransportState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            TransportModel transport, bool? showUserInfo, bool? canUpdate)
        view,
    required TResult Function(TransportModel transport) edit,
    required TResult Function(String message) loading,
    required TResult Function(String? message, bool popScreen) success,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            TransportModel transport, bool? showUserInfo, bool? canUpdate)?
        view,
    TResult Function(TransportModel transport)? edit,
    TResult Function(String message)? loading,
    TResult Function(String? message, bool popScreen)? success,
    TResult Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            TransportModel transport, bool? showUserInfo, bool? canUpdate)?
        view,
    TResult Function(TransportModel transport)? edit,
    TResult Function(String message)? loading,
    TResult Function(String? message, bool popScreen)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_View value) view,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_View value)? view,
    TResult Function(_Edit value)? edit,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_View value)? view,
    TResult Function(_Edit value)? edit,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManageTransportStateCopyWith<$Res> {
  factory $ManageTransportStateCopyWith(ManageTransportState value,
          $Res Function(ManageTransportState) then) =
      _$ManageTransportStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ManageTransportStateCopyWithImpl<$Res>
    implements $ManageTransportStateCopyWith<$Res> {
  _$ManageTransportStateCopyWithImpl(this._value, this._then);

  final ManageTransportState _value;
  // ignore: unused_field
  final $Res Function(ManageTransportState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$ManageTransportStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'ManageTransportState.initial()';
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
    required TResult Function(
            TransportModel transport, bool? showUserInfo, bool? canUpdate)
        view,
    required TResult Function(TransportModel transport) edit,
    required TResult Function(String message) loading,
    required TResult Function(String? message, bool popScreen) success,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            TransportModel transport, bool? showUserInfo, bool? canUpdate)?
        view,
    TResult Function(TransportModel transport)? edit,
    TResult Function(String message)? loading,
    TResult Function(String? message, bool popScreen)? success,
    TResult Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            TransportModel transport, bool? showUserInfo, bool? canUpdate)?
        view,
    TResult Function(TransportModel transport)? edit,
    TResult Function(String message)? loading,
    TResult Function(String? message, bool popScreen)? success,
    TResult Function(String message)? failure,
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
    required TResult Function(_View value) view,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_View value)? view,
    TResult Function(_Edit value)? edit,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_View value)? view,
    TResult Function(_Edit value)? edit,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ManageTransportState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$ViewCopyWith<$Res> {
  factory _$ViewCopyWith(_View value, $Res Function(_View) then) =
      __$ViewCopyWithImpl<$Res>;
  $Res call({TransportModel transport, bool? showUserInfo, bool? canUpdate});

  $TransportModelCopyWith<$Res> get transport;
}

/// @nodoc
class __$ViewCopyWithImpl<$Res> extends _$ManageTransportStateCopyWithImpl<$Res>
    implements _$ViewCopyWith<$Res> {
  __$ViewCopyWithImpl(_View _value, $Res Function(_View) _then)
      : super(_value, (v) => _then(v as _View));

  @override
  _View get _value => super._value as _View;

  @override
  $Res call({
    Object? transport = freezed,
    Object? showUserInfo = freezed,
    Object? canUpdate = freezed,
  }) {
    return _then(_View(
      transport: transport == freezed
          ? _value.transport
          : transport // ignore: cast_nullable_to_non_nullable
              as TransportModel,
      showUserInfo: showUserInfo == freezed
          ? _value.showUserInfo
          : showUserInfo // ignore: cast_nullable_to_non_nullable
              as bool?,
      canUpdate: canUpdate == freezed
          ? _value.canUpdate
          : canUpdate // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $TransportModelCopyWith<$Res> get transport {
    return $TransportModelCopyWith<$Res>(_value.transport, (value) {
      return _then(_value.copyWith(transport: value));
    });
  }
}

/// @nodoc

class _$_View implements _View {
  const _$_View(
      {required this.transport,
      this.showUserInfo = false,
      this.canUpdate = false});

  @override
  final TransportModel transport;
  @JsonKey()
  @override
  final bool? showUserInfo;
  @JsonKey()
  @override
  final bool? canUpdate;

  @override
  String toString() {
    return 'ManageTransportState.view(transport: $transport, showUserInfo: $showUserInfo, canUpdate: $canUpdate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _View &&
            const DeepCollectionEquality().equals(other.transport, transport) &&
            const DeepCollectionEquality()
                .equals(other.showUserInfo, showUserInfo) &&
            const DeepCollectionEquality().equals(other.canUpdate, canUpdate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(transport),
      const DeepCollectionEquality().hash(showUserInfo),
      const DeepCollectionEquality().hash(canUpdate));

  @JsonKey(ignore: true)
  @override
  _$ViewCopyWith<_View> get copyWith =>
      __$ViewCopyWithImpl<_View>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            TransportModel transport, bool? showUserInfo, bool? canUpdate)
        view,
    required TResult Function(TransportModel transport) edit,
    required TResult Function(String message) loading,
    required TResult Function(String? message, bool popScreen) success,
    required TResult Function(String message) failure,
  }) {
    return view(transport, showUserInfo, canUpdate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            TransportModel transport, bool? showUserInfo, bool? canUpdate)?
        view,
    TResult Function(TransportModel transport)? edit,
    TResult Function(String message)? loading,
    TResult Function(String? message, bool popScreen)? success,
    TResult Function(String message)? failure,
  }) {
    return view?.call(transport, showUserInfo, canUpdate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            TransportModel transport, bool? showUserInfo, bool? canUpdate)?
        view,
    TResult Function(TransportModel transport)? edit,
    TResult Function(String message)? loading,
    TResult Function(String? message, bool popScreen)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (view != null) {
      return view(transport, showUserInfo, canUpdate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_View value) view,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return view(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_View value)? view,
    TResult Function(_Edit value)? edit,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
  }) {
    return view?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_View value)? view,
    TResult Function(_Edit value)? edit,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (view != null) {
      return view(this);
    }
    return orElse();
  }
}

abstract class _View implements ManageTransportState {
  const factory _View(
      {required TransportModel transport,
      bool? showUserInfo,
      bool? canUpdate}) = _$_View;

  TransportModel get transport;
  bool? get showUserInfo;
  bool? get canUpdate;
  @JsonKey(ignore: true)
  _$ViewCopyWith<_View> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$EditCopyWith<$Res> {
  factory _$EditCopyWith(_Edit value, $Res Function(_Edit) then) =
      __$EditCopyWithImpl<$Res>;
  $Res call({TransportModel transport});

  $TransportModelCopyWith<$Res> get transport;
}

/// @nodoc
class __$EditCopyWithImpl<$Res> extends _$ManageTransportStateCopyWithImpl<$Res>
    implements _$EditCopyWith<$Res> {
  __$EditCopyWithImpl(_Edit _value, $Res Function(_Edit) _then)
      : super(_value, (v) => _then(v as _Edit));

  @override
  _Edit get _value => super._value as _Edit;

  @override
  $Res call({
    Object? transport = freezed,
  }) {
    return _then(_Edit(
      transport == freezed
          ? _value.transport
          : transport // ignore: cast_nullable_to_non_nullable
              as TransportModel,
    ));
  }

  @override
  $TransportModelCopyWith<$Res> get transport {
    return $TransportModelCopyWith<$Res>(_value.transport, (value) {
      return _then(_value.copyWith(transport: value));
    });
  }
}

/// @nodoc

class _$_Edit implements _Edit {
  const _$_Edit(this.transport);

  @override
  final TransportModel transport;

  @override
  String toString() {
    return 'ManageTransportState.edit(transport: $transport)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Edit &&
            const DeepCollectionEquality().equals(other.transport, transport));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(transport));

  @JsonKey(ignore: true)
  @override
  _$EditCopyWith<_Edit> get copyWith =>
      __$EditCopyWithImpl<_Edit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            TransportModel transport, bool? showUserInfo, bool? canUpdate)
        view,
    required TResult Function(TransportModel transport) edit,
    required TResult Function(String message) loading,
    required TResult Function(String? message, bool popScreen) success,
    required TResult Function(String message) failure,
  }) {
    return edit(transport);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            TransportModel transport, bool? showUserInfo, bool? canUpdate)?
        view,
    TResult Function(TransportModel transport)? edit,
    TResult Function(String message)? loading,
    TResult Function(String? message, bool popScreen)? success,
    TResult Function(String message)? failure,
  }) {
    return edit?.call(transport);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            TransportModel transport, bool? showUserInfo, bool? canUpdate)?
        view,
    TResult Function(TransportModel transport)? edit,
    TResult Function(String message)? loading,
    TResult Function(String? message, bool popScreen)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(transport);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_View value) view,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return edit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_View value)? view,
    TResult Function(_Edit value)? edit,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
  }) {
    return edit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_View value)? view,
    TResult Function(_Edit value)? edit,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(this);
    }
    return orElse();
  }
}

abstract class _Edit implements ManageTransportState {
  const factory _Edit(TransportModel transport) = _$_Edit;

  TransportModel get transport;
  @JsonKey(ignore: true)
  _$EditCopyWith<_Edit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    extends _$ManageTransportStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_Loading(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ManageTransportState.loading(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loading &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            TransportModel transport, bool? showUserInfo, bool? canUpdate)
        view,
    required TResult Function(TransportModel transport) edit,
    required TResult Function(String message) loading,
    required TResult Function(String? message, bool popScreen) success,
    required TResult Function(String message) failure,
  }) {
    return loading(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            TransportModel transport, bool? showUserInfo, bool? canUpdate)?
        view,
    TResult Function(TransportModel transport)? edit,
    TResult Function(String message)? loading,
    TResult Function(String? message, bool popScreen)? success,
    TResult Function(String message)? failure,
  }) {
    return loading?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            TransportModel transport, bool? showUserInfo, bool? canUpdate)?
        view,
    TResult Function(TransportModel transport)? edit,
    TResult Function(String message)? loading,
    TResult Function(String? message, bool popScreen)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_View value) view,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_View value)? view,
    TResult Function(_Edit value)? edit,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_View value)? view,
    TResult Function(_Edit value)? edit,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ManageTransportState {
  const factory _Loading(String message) = _$_Loading;

  String get message;
  @JsonKey(ignore: true)
  _$LoadingCopyWith<_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SuccessCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) then) =
      __$SuccessCopyWithImpl<$Res>;
  $Res call({String? message, bool popScreen});
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    extends _$ManageTransportStateCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(_Success _value, $Res Function(_Success) _then)
      : super(_value, (v) => _then(v as _Success));

  @override
  _Success get _value => super._value as _Success;

  @override
  $Res call({
    Object? message = freezed,
    Object? popScreen = freezed,
  }) {
    return _then(_Success(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      popScreen: popScreen == freezed
          ? _value.popScreen
          : popScreen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success({this.message, this.popScreen = false});

  @override
  final String? message;
  @JsonKey()
  @override
  final bool popScreen;

  @override
  String toString() {
    return 'ManageTransportState.success(message: $message, popScreen: $popScreen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Success &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.popScreen, popScreen));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(popScreen));

  @JsonKey(ignore: true)
  @override
  _$SuccessCopyWith<_Success> get copyWith =>
      __$SuccessCopyWithImpl<_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            TransportModel transport, bool? showUserInfo, bool? canUpdate)
        view,
    required TResult Function(TransportModel transport) edit,
    required TResult Function(String message) loading,
    required TResult Function(String? message, bool popScreen) success,
    required TResult Function(String message) failure,
  }) {
    return success(message, popScreen);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            TransportModel transport, bool? showUserInfo, bool? canUpdate)?
        view,
    TResult Function(TransportModel transport)? edit,
    TResult Function(String message)? loading,
    TResult Function(String? message, bool popScreen)? success,
    TResult Function(String message)? failure,
  }) {
    return success?.call(message, popScreen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            TransportModel transport, bool? showUserInfo, bool? canUpdate)?
        view,
    TResult Function(TransportModel transport)? edit,
    TResult Function(String message)? loading,
    TResult Function(String? message, bool popScreen)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(message, popScreen);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_View value) view,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_View value)? view,
    TResult Function(_Edit value)? edit,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_View value)? view,
    TResult Function(_Edit value)? edit,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements ManageTransportState {
  const factory _Success({String? message, bool popScreen}) = _$_Success;

  String? get message;
  bool get popScreen;
  @JsonKey(ignore: true)
  _$SuccessCopyWith<_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FailureCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) then) =
      __$FailureCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$FailureCopyWithImpl<$Res>
    extends _$ManageTransportStateCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(_Failure _value, $Res Function(_Failure) _then)
      : super(_value, (v) => _then(v as _Failure));

  @override
  _Failure get _value => super._value as _Failure;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_Failure(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Failure implements _Failure {
  const _$_Failure(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ManageTransportState.failure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Failure &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$FailureCopyWith<_Failure> get copyWith =>
      __$FailureCopyWithImpl<_Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            TransportModel transport, bool? showUserInfo, bool? canUpdate)
        view,
    required TResult Function(TransportModel transport) edit,
    required TResult Function(String message) loading,
    required TResult Function(String? message, bool popScreen) success,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            TransportModel transport, bool? showUserInfo, bool? canUpdate)?
        view,
    TResult Function(TransportModel transport)? edit,
    TResult Function(String message)? loading,
    TResult Function(String? message, bool popScreen)? success,
    TResult Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            TransportModel transport, bool? showUserInfo, bool? canUpdate)?
        view,
    TResult Function(TransportModel transport)? edit,
    TResult Function(String message)? loading,
    TResult Function(String? message, bool popScreen)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_View value) view,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_View value)? view,
    TResult Function(_Edit value)? edit,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_View value)? view,
    TResult Function(_Edit value)? edit,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements ManageTransportState {
  const factory _Failure(String message) = _$_Failure;

  String get message;
  @JsonKey(ignore: true)
  _$FailureCopyWith<_Failure> get copyWith =>
      throw _privateConstructorUsedError;
}
