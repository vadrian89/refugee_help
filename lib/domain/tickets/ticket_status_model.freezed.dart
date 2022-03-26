// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ticket_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TicketStatusModel _$TicketStatusModelFromJson(Map<String, dynamic> json) {
  return _TicketStatusModel.fromJson(json);
}

/// @nodoc
class _$TicketStatusModelTearOff {
  const _$TicketStatusModelTearOff();

  _TicketStatusModel call(
      {required int id,
      @JsonKey(ignore: true) String? name,
      @JsonKey(ignore: true) IconData? icon,
      @JsonKey(ignore: true) Color? color}) {
    return _TicketStatusModel(
      id: id,
      name: name,
      icon: icon,
      color: color,
    );
  }

  TicketStatusModel fromJson(Map<String, Object?> json) {
    return TicketStatusModel.fromJson(json);
  }
}

/// @nodoc
const $TicketStatusModel = _$TicketStatusModelTearOff();

/// @nodoc
mixin _$TicketStatusModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  IconData? get icon => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  Color? get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketStatusModelCopyWith<TicketStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketStatusModelCopyWith<$Res> {
  factory $TicketStatusModelCopyWith(
          TicketStatusModel value, $Res Function(TicketStatusModel) then) =
      _$TicketStatusModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(ignore: true) String? name,
      @JsonKey(ignore: true) IconData? icon,
      @JsonKey(ignore: true) Color? color});
}

/// @nodoc
class _$TicketStatusModelCopyWithImpl<$Res>
    implements $TicketStatusModelCopyWith<$Res> {
  _$TicketStatusModelCopyWithImpl(this._value, this._then);

  final TicketStatusModel _value;
  // ignore: unused_field
  final $Res Function(TicketStatusModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? icon = freezed,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
    ));
  }
}

/// @nodoc
abstract class _$TicketStatusModelCopyWith<$Res>
    implements $TicketStatusModelCopyWith<$Res> {
  factory _$TicketStatusModelCopyWith(
          _TicketStatusModel value, $Res Function(_TicketStatusModel) then) =
      __$TicketStatusModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(ignore: true) String? name,
      @JsonKey(ignore: true) IconData? icon,
      @JsonKey(ignore: true) Color? color});
}

/// @nodoc
class __$TicketStatusModelCopyWithImpl<$Res>
    extends _$TicketStatusModelCopyWithImpl<$Res>
    implements _$TicketStatusModelCopyWith<$Res> {
  __$TicketStatusModelCopyWithImpl(
      _TicketStatusModel _value, $Res Function(_TicketStatusModel) _then)
      : super(_value, (v) => _then(v as _TicketStatusModel));

  @override
  _TicketStatusModel get _value => super._value as _TicketStatusModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? icon = freezed,
    Object? color = freezed,
  }) {
    return _then(_TicketStatusModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TicketStatusModel extends _TicketStatusModel {
  const _$_TicketStatusModel(
      {required this.id,
      @JsonKey(ignore: true) this.name,
      @JsonKey(ignore: true) this.icon,
      @JsonKey(ignore: true) this.color})
      : super._();

  factory _$_TicketStatusModel.fromJson(Map<String, dynamic> json) =>
      _$$_TicketStatusModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(ignore: true)
  final String? name;
  @override
  @JsonKey(ignore: true)
  final IconData? icon;
  @override
  @JsonKey(ignore: true)
  final Color? color;

  @override
  String toString() {
    return 'TicketStatusModel(id: $id, name: $name, icon: $icon, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TicketStatusModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.icon, icon) &&
            const DeepCollectionEquality().equals(other.color, color));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(icon),
      const DeepCollectionEquality().hash(color));

  @JsonKey(ignore: true)
  @override
  _$TicketStatusModelCopyWith<_TicketStatusModel> get copyWith =>
      __$TicketStatusModelCopyWithImpl<_TicketStatusModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TicketStatusModelToJson(this);
  }
}

abstract class _TicketStatusModel extends TicketStatusModel {
  const factory _TicketStatusModel(
      {required int id,
      @JsonKey(ignore: true) String? name,
      @JsonKey(ignore: true) IconData? icon,
      @JsonKey(ignore: true) Color? color}) = _$_TicketStatusModel;
  const _TicketStatusModel._() : super._();

  factory _TicketStatusModel.fromJson(Map<String, dynamic> json) =
      _$_TicketStatusModel.fromJson;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  String? get name;
  @override
  @JsonKey(ignore: true)
  IconData? get icon;
  @override
  @JsonKey(ignore: true)
  Color? get color;
  @override
  @JsonKey(ignore: true)
  _$TicketStatusModelCopyWith<_TicketStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}
