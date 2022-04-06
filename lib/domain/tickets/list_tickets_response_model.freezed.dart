// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'list_tickets_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ListTicketsResponseModelTearOff {
  const _$ListTicketsResponseModelTearOff();

  _ListTicketsResponseModel call(
      {required int totalRows,
      required List<TicketModel> list,
      FirestorePaginationInfo<TicketModel>? paginationInfo}) {
    return _ListTicketsResponseModel(
      totalRows: totalRows,
      list: list,
      paginationInfo: paginationInfo,
    );
  }
}

/// @nodoc
const $ListTicketsResponseModel = _$ListTicketsResponseModelTearOff();

/// @nodoc
mixin _$ListTicketsResponseModel {
  int get totalRows => throw _privateConstructorUsedError;
  List<TicketModel> get list => throw _privateConstructorUsedError;
  FirestorePaginationInfo<TicketModel>? get paginationInfo =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListTicketsResponseModelCopyWith<ListTicketsResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListTicketsResponseModelCopyWith<$Res> {
  factory $ListTicketsResponseModelCopyWith(ListTicketsResponseModel value,
          $Res Function(ListTicketsResponseModel) then) =
      _$ListTicketsResponseModelCopyWithImpl<$Res>;
  $Res call(
      {int totalRows,
      List<TicketModel> list,
      FirestorePaginationInfo<TicketModel>? paginationInfo});
}

/// @nodoc
class _$ListTicketsResponseModelCopyWithImpl<$Res>
    implements $ListTicketsResponseModelCopyWith<$Res> {
  _$ListTicketsResponseModelCopyWithImpl(this._value, this._then);

  final ListTicketsResponseModel _value;
  // ignore: unused_field
  final $Res Function(ListTicketsResponseModel) _then;

  @override
  $Res call({
    Object? totalRows = freezed,
    Object? list = freezed,
    Object? paginationInfo = freezed,
  }) {
    return _then(_value.copyWith(
      totalRows: totalRows == freezed
          ? _value.totalRows
          : totalRows // ignore: cast_nullable_to_non_nullable
              as int,
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<TicketModel>,
      paginationInfo: paginationInfo == freezed
          ? _value.paginationInfo
          : paginationInfo // ignore: cast_nullable_to_non_nullable
              as FirestorePaginationInfo<TicketModel>?,
    ));
  }
}

/// @nodoc
abstract class _$ListTicketsResponseModelCopyWith<$Res>
    implements $ListTicketsResponseModelCopyWith<$Res> {
  factory _$ListTicketsResponseModelCopyWith(_ListTicketsResponseModel value,
          $Res Function(_ListTicketsResponseModel) then) =
      __$ListTicketsResponseModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int totalRows,
      List<TicketModel> list,
      FirestorePaginationInfo<TicketModel>? paginationInfo});
}

/// @nodoc
class __$ListTicketsResponseModelCopyWithImpl<$Res>
    extends _$ListTicketsResponseModelCopyWithImpl<$Res>
    implements _$ListTicketsResponseModelCopyWith<$Res> {
  __$ListTicketsResponseModelCopyWithImpl(_ListTicketsResponseModel _value,
      $Res Function(_ListTicketsResponseModel) _then)
      : super(_value, (v) => _then(v as _ListTicketsResponseModel));

  @override
  _ListTicketsResponseModel get _value =>
      super._value as _ListTicketsResponseModel;

  @override
  $Res call({
    Object? totalRows = freezed,
    Object? list = freezed,
    Object? paginationInfo = freezed,
  }) {
    return _then(_ListTicketsResponseModel(
      totalRows: totalRows == freezed
          ? _value.totalRows
          : totalRows // ignore: cast_nullable_to_non_nullable
              as int,
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<TicketModel>,
      paginationInfo: paginationInfo == freezed
          ? _value.paginationInfo
          : paginationInfo // ignore: cast_nullable_to_non_nullable
              as FirestorePaginationInfo<TicketModel>?,
    ));
  }
}

/// @nodoc

class _$_ListTicketsResponseModel implements _ListTicketsResponseModel {
  const _$_ListTicketsResponseModel(
      {required this.totalRows, required this.list, this.paginationInfo});

  @override
  final int totalRows;
  @override
  final List<TicketModel> list;
  @override
  final FirestorePaginationInfo<TicketModel>? paginationInfo;

  @override
  String toString() {
    return 'ListTicketsResponseModel(totalRows: $totalRows, list: $list, paginationInfo: $paginationInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ListTicketsResponseModel &&
            const DeepCollectionEquality().equals(other.totalRows, totalRows) &&
            const DeepCollectionEquality().equals(other.list, list) &&
            const DeepCollectionEquality()
                .equals(other.paginationInfo, paginationInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(totalRows),
      const DeepCollectionEquality().hash(list),
      const DeepCollectionEquality().hash(paginationInfo));

  @JsonKey(ignore: true)
  @override
  _$ListTicketsResponseModelCopyWith<_ListTicketsResponseModel> get copyWith =>
      __$ListTicketsResponseModelCopyWithImpl<_ListTicketsResponseModel>(
          this, _$identity);
}

abstract class _ListTicketsResponseModel implements ListTicketsResponseModel {
  const factory _ListTicketsResponseModel(
          {required int totalRows,
          required List<TicketModel> list,
          FirestorePaginationInfo<TicketModel>? paginationInfo}) =
      _$_ListTicketsResponseModel;

  @override
  int get totalRows;
  @override
  List<TicketModel> get list;
  @override
  FirestorePaginationInfo<TicketModel>? get paginationInfo;
  @override
  @JsonKey(ignore: true)
  _$ListTicketsResponseModelCopyWith<_ListTicketsResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
