// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'list_transport_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ListTransportStateTearOff {
  const _$ListTransportStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _View view(
      {required List<TransportModel> list,
      required int page,
      required int pageLimit,
      required int totalRows}) {
    return _View(
      list: list,
      page: page,
      pageLimit: pageLimit,
      totalRows: totalRows,
    );
  }

  _Deleting deleting() {
    return const _Deleting();
  }

  _Loading loading(String message) {
    return _Loading(
      message,
    );
  }

  _Failure failure(String message) {
    return _Failure(
      message,
    );
  }

  _Success success(String message) {
    return _Success(
      message,
    );
  }
}

/// @nodoc
const $ListTransportState = _$ListTransportStateTearOff();

/// @nodoc
mixin _$ListTransportState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<TransportModel> list, int page, int pageLimit, int totalRows)
        view,
    required TResult Function() deleting,
    required TResult Function(String message) loading,
    required TResult Function(String message) failure,
    required TResult Function(String message) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<TransportModel> list, int page, int pageLimit, int totalRows)?
        view,
    TResult Function()? deleting,
    TResult Function(String message)? loading,
    TResult Function(String message)? failure,
    TResult Function(String message)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<TransportModel> list, int page, int pageLimit, int totalRows)?
        view,
    TResult Function()? deleting,
    TResult Function(String message)? loading,
    TResult Function(String message)? failure,
    TResult Function(String message)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_View value) view,
    required TResult Function(_Deleting value) deleting,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_View value)? view,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_View value)? view,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListTransportStateCopyWith<$Res> {
  factory $ListTransportStateCopyWith(
          ListTransportState value, $Res Function(ListTransportState) then) =
      _$ListTransportStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ListTransportStateCopyWithImpl<$Res>
    implements $ListTransportStateCopyWith<$Res> {
  _$ListTransportStateCopyWithImpl(this._value, this._then);

  final ListTransportState _value;
  // ignore: unused_field
  final $Res Function(ListTransportState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$ListTransportStateCopyWithImpl<$Res>
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
    return 'ListTransportState.initial()';
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
            List<TransportModel> list, int page, int pageLimit, int totalRows)
        view,
    required TResult Function() deleting,
    required TResult Function(String message) loading,
    required TResult Function(String message) failure,
    required TResult Function(String message) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<TransportModel> list, int page, int pageLimit, int totalRows)?
        view,
    TResult Function()? deleting,
    TResult Function(String message)? loading,
    TResult Function(String message)? failure,
    TResult Function(String message)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<TransportModel> list, int page, int pageLimit, int totalRows)?
        view,
    TResult Function()? deleting,
    TResult Function(String message)? loading,
    TResult Function(String message)? failure,
    TResult Function(String message)? success,
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
    required TResult Function(_Deleting value) deleting,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_View value)? view,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_View value)? view,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ListTransportState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$ViewCopyWith<$Res> {
  factory _$ViewCopyWith(_View value, $Res Function(_View) then) =
      __$ViewCopyWithImpl<$Res>;
  $Res call(
      {List<TransportModel> list, int page, int pageLimit, int totalRows});
}

/// @nodoc
class __$ViewCopyWithImpl<$Res> extends _$ListTransportStateCopyWithImpl<$Res>
    implements _$ViewCopyWith<$Res> {
  __$ViewCopyWithImpl(_View _value, $Res Function(_View) _then)
      : super(_value, (v) => _then(v as _View));

  @override
  _View get _value => super._value as _View;

  @override
  $Res call({
    Object? list = freezed,
    Object? page = freezed,
    Object? pageLimit = freezed,
    Object? totalRows = freezed,
  }) {
    return _then(_View(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<TransportModel>,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageLimit: pageLimit == freezed
          ? _value.pageLimit
          : pageLimit // ignore: cast_nullable_to_non_nullable
              as int,
      totalRows: totalRows == freezed
          ? _value.totalRows
          : totalRows // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_View implements _View {
  const _$_View(
      {required this.list,
      required this.page,
      required this.pageLimit,
      required this.totalRows});

  @override
  final List<TransportModel> list;
  @override
  final int page;
  @override
  final int pageLimit;
  @override
  final int totalRows;

  @override
  String toString() {
    return 'ListTransportState.view(list: $list, page: $page, pageLimit: $pageLimit, totalRows: $totalRows)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _View &&
            const DeepCollectionEquality().equals(other.list, list) &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other.pageLimit, pageLimit) &&
            const DeepCollectionEquality().equals(other.totalRows, totalRows));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(list),
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(pageLimit),
      const DeepCollectionEquality().hash(totalRows));

  @JsonKey(ignore: true)
  @override
  _$ViewCopyWith<_View> get copyWith =>
      __$ViewCopyWithImpl<_View>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<TransportModel> list, int page, int pageLimit, int totalRows)
        view,
    required TResult Function() deleting,
    required TResult Function(String message) loading,
    required TResult Function(String message) failure,
    required TResult Function(String message) success,
  }) {
    return view(list, page, pageLimit, totalRows);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<TransportModel> list, int page, int pageLimit, int totalRows)?
        view,
    TResult Function()? deleting,
    TResult Function(String message)? loading,
    TResult Function(String message)? failure,
    TResult Function(String message)? success,
  }) {
    return view?.call(list, page, pageLimit, totalRows);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<TransportModel> list, int page, int pageLimit, int totalRows)?
        view,
    TResult Function()? deleting,
    TResult Function(String message)? loading,
    TResult Function(String message)? failure,
    TResult Function(String message)? success,
    required TResult orElse(),
  }) {
    if (view != null) {
      return view(list, page, pageLimit, totalRows);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_View value) view,
    required TResult Function(_Deleting value) deleting,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
  }) {
    return view(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_View value)? view,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
  }) {
    return view?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_View value)? view,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (view != null) {
      return view(this);
    }
    return orElse();
  }
}

abstract class _View implements ListTransportState {
  const factory _View(
      {required List<TransportModel> list,
      required int page,
      required int pageLimit,
      required int totalRows}) = _$_View;

  List<TransportModel> get list;
  int get page;
  int get pageLimit;
  int get totalRows;
  @JsonKey(ignore: true)
  _$ViewCopyWith<_View> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DeletingCopyWith<$Res> {
  factory _$DeletingCopyWith(_Deleting value, $Res Function(_Deleting) then) =
      __$DeletingCopyWithImpl<$Res>;
}

/// @nodoc
class __$DeletingCopyWithImpl<$Res>
    extends _$ListTransportStateCopyWithImpl<$Res>
    implements _$DeletingCopyWith<$Res> {
  __$DeletingCopyWithImpl(_Deleting _value, $Res Function(_Deleting) _then)
      : super(_value, (v) => _then(v as _Deleting));

  @override
  _Deleting get _value => super._value as _Deleting;
}

/// @nodoc

class _$_Deleting implements _Deleting {
  const _$_Deleting();

  @override
  String toString() {
    return 'ListTransportState.deleting()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Deleting);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<TransportModel> list, int page, int pageLimit, int totalRows)
        view,
    required TResult Function() deleting,
    required TResult Function(String message) loading,
    required TResult Function(String message) failure,
    required TResult Function(String message) success,
  }) {
    return deleting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<TransportModel> list, int page, int pageLimit, int totalRows)?
        view,
    TResult Function()? deleting,
    TResult Function(String message)? loading,
    TResult Function(String message)? failure,
    TResult Function(String message)? success,
  }) {
    return deleting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<TransportModel> list, int page, int pageLimit, int totalRows)?
        view,
    TResult Function()? deleting,
    TResult Function(String message)? loading,
    TResult Function(String message)? failure,
    TResult Function(String message)? success,
    required TResult orElse(),
  }) {
    if (deleting != null) {
      return deleting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_View value) view,
    required TResult Function(_Deleting value) deleting,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
  }) {
    return deleting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_View value)? view,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
  }) {
    return deleting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_View value)? view,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (deleting != null) {
      return deleting(this);
    }
    return orElse();
  }
}

abstract class _Deleting implements ListTransportState {
  const factory _Deleting() = _$_Deleting;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    extends _$ListTransportStateCopyWithImpl<$Res>
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
    return 'ListTransportState.loading(message: $message)';
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
            List<TransportModel> list, int page, int pageLimit, int totalRows)
        view,
    required TResult Function() deleting,
    required TResult Function(String message) loading,
    required TResult Function(String message) failure,
    required TResult Function(String message) success,
  }) {
    return loading(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<TransportModel> list, int page, int pageLimit, int totalRows)?
        view,
    TResult Function()? deleting,
    TResult Function(String message)? loading,
    TResult Function(String message)? failure,
    TResult Function(String message)? success,
  }) {
    return loading?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<TransportModel> list, int page, int pageLimit, int totalRows)?
        view,
    TResult Function()? deleting,
    TResult Function(String message)? loading,
    TResult Function(String message)? failure,
    TResult Function(String message)? success,
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
    required TResult Function(_Deleting value) deleting,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_View value)? view,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_View value)? view,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ListTransportState {
  const factory _Loading(String message) = _$_Loading;

  String get message;
  @JsonKey(ignore: true)
  _$LoadingCopyWith<_Loading> get copyWith =>
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
    extends _$ListTransportStateCopyWithImpl<$Res>
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
    return 'ListTransportState.failure(message: $message)';
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
            List<TransportModel> list, int page, int pageLimit, int totalRows)
        view,
    required TResult Function() deleting,
    required TResult Function(String message) loading,
    required TResult Function(String message) failure,
    required TResult Function(String message) success,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<TransportModel> list, int page, int pageLimit, int totalRows)?
        view,
    TResult Function()? deleting,
    TResult Function(String message)? loading,
    TResult Function(String message)? failure,
    TResult Function(String message)? success,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<TransportModel> list, int page, int pageLimit, int totalRows)?
        view,
    TResult Function()? deleting,
    TResult Function(String message)? loading,
    TResult Function(String message)? failure,
    TResult Function(String message)? success,
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
    required TResult Function(_Deleting value) deleting,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_View value)? view,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_View value)? view,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements ListTransportState {
  const factory _Failure(String message) = _$_Failure;

  String get message;
  @JsonKey(ignore: true)
  _$FailureCopyWith<_Failure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SuccessCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) then) =
      __$SuccessCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    extends _$ListTransportStateCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(_Success _value, $Res Function(_Success) _then)
      : super(_value, (v) => _then(v as _Success));

  @override
  _Success get _value => super._value as _Success;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_Success(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ListTransportState.success(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Success &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$SuccessCopyWith<_Success> get copyWith =>
      __$SuccessCopyWithImpl<_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            List<TransportModel> list, int page, int pageLimit, int totalRows)
        view,
    required TResult Function() deleting,
    required TResult Function(String message) loading,
    required TResult Function(String message) failure,
    required TResult Function(String message) success,
  }) {
    return success(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<TransportModel> list, int page, int pageLimit, int totalRows)?
        view,
    TResult Function()? deleting,
    TResult Function(String message)? loading,
    TResult Function(String message)? failure,
    TResult Function(String message)? success,
  }) {
    return success?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(
            List<TransportModel> list, int page, int pageLimit, int totalRows)?
        view,
    TResult Function()? deleting,
    TResult Function(String message)? loading,
    TResult Function(String message)? failure,
    TResult Function(String message)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_View value) view,
    required TResult Function(_Deleting value) deleting,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_View value)? view,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_View value)? view,
    TResult Function(_Deleting value)? deleting,
    TResult Function(_Loading value)? loading,
    TResult Function(_Failure value)? failure,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements ListTransportState {
  const factory _Success(String message) = _$_Success;

  String get message;
  @JsonKey(ignore: true)
  _$SuccessCopyWith<_Success> get copyWith =>
      throw _privateConstructorUsedError;
}
