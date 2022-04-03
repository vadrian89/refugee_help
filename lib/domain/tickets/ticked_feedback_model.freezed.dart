// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ticked_feedback_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TicketFeedbackModel _$TicketFeedbackModelFromJson(Map<String, dynamic> json) {
  return _TicketFeedbackModel.fromJson(json);
}

/// @nodoc
class _$TicketFeedbackModelTearOff {
  const _$TicketFeedbackModelTearOff();

  _TicketFeedbackModel call(
      {FeedbackTypeModel? feedbackType,
      String? remarks = "",
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? createdAt,
      UserInfoModel? user}) {
    return _TicketFeedbackModel(
      feedbackType: feedbackType,
      remarks: remarks,
      createdAt: createdAt,
      user: user,
    );
  }

  TicketFeedbackModel fromJson(Map<String, Object?> json) {
    return TicketFeedbackModel.fromJson(json);
  }
}

/// @nodoc
const $TicketFeedbackModel = _$TicketFeedbackModelTearOff();

/// @nodoc
mixin _$TicketFeedbackModel {
  FeedbackTypeModel? get feedbackType => throw _privateConstructorUsedError;
  String? get remarks => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  UserInfoModel? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketFeedbackModelCopyWith<TicketFeedbackModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketFeedbackModelCopyWith<$Res> {
  factory $TicketFeedbackModelCopyWith(
          TicketFeedbackModel value, $Res Function(TicketFeedbackModel) then) =
      _$TicketFeedbackModelCopyWithImpl<$Res>;
  $Res call(
      {FeedbackTypeModel? feedbackType,
      String? remarks,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? createdAt,
      UserInfoModel? user});

  $UserInfoModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$TicketFeedbackModelCopyWithImpl<$Res>
    implements $TicketFeedbackModelCopyWith<$Res> {
  _$TicketFeedbackModelCopyWithImpl(this._value, this._then);

  final TicketFeedbackModel _value;
  // ignore: unused_field
  final $Res Function(TicketFeedbackModel) _then;

  @override
  $Res call({
    Object? feedbackType = freezed,
    Object? remarks = freezed,
    Object? createdAt = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      feedbackType: feedbackType == freezed
          ? _value.feedbackType
          : feedbackType // ignore: cast_nullable_to_non_nullable
              as FeedbackTypeModel?,
      remarks: remarks == freezed
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserInfoModel?,
    ));
  }

  @override
  $UserInfoModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserInfoModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$TicketFeedbackModelCopyWith<$Res>
    implements $TicketFeedbackModelCopyWith<$Res> {
  factory _$TicketFeedbackModelCopyWith(_TicketFeedbackModel value,
          $Res Function(_TicketFeedbackModel) then) =
      __$TicketFeedbackModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {FeedbackTypeModel? feedbackType,
      String? remarks,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? createdAt,
      UserInfoModel? user});

  @override
  $UserInfoModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$TicketFeedbackModelCopyWithImpl<$Res>
    extends _$TicketFeedbackModelCopyWithImpl<$Res>
    implements _$TicketFeedbackModelCopyWith<$Res> {
  __$TicketFeedbackModelCopyWithImpl(
      _TicketFeedbackModel _value, $Res Function(_TicketFeedbackModel) _then)
      : super(_value, (v) => _then(v as _TicketFeedbackModel));

  @override
  _TicketFeedbackModel get _value => super._value as _TicketFeedbackModel;

  @override
  $Res call({
    Object? feedbackType = freezed,
    Object? remarks = freezed,
    Object? createdAt = freezed,
    Object? user = freezed,
  }) {
    return _then(_TicketFeedbackModel(
      feedbackType: feedbackType == freezed
          ? _value.feedbackType
          : feedbackType // ignore: cast_nullable_to_non_nullable
              as FeedbackTypeModel?,
      remarks: remarks == freezed
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserInfoModel?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_TicketFeedbackModel implements _TicketFeedbackModel {
  const _$_TicketFeedbackModel(
      {this.feedbackType,
      this.remarks = "",
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          this.createdAt,
      this.user});

  factory _$_TicketFeedbackModel.fromJson(Map<String, dynamic> json) =>
      _$$_TicketFeedbackModelFromJson(json);

  @override
  final FeedbackTypeModel? feedbackType;
  @JsonKey()
  @override
  final String? remarks;
  @override
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime? createdAt;
  @override
  final UserInfoModel? user;

  @override
  String toString() {
    return 'TicketFeedbackModel(feedbackType: $feedbackType, remarks: $remarks, createdAt: $createdAt, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TicketFeedbackModel &&
            const DeepCollectionEquality()
                .equals(other.feedbackType, feedbackType) &&
            const DeepCollectionEquality().equals(other.remarks, remarks) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(feedbackType),
      const DeepCollectionEquality().hash(remarks),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$TicketFeedbackModelCopyWith<_TicketFeedbackModel> get copyWith =>
      __$TicketFeedbackModelCopyWithImpl<_TicketFeedbackModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TicketFeedbackModelToJson(this);
  }
}

abstract class _TicketFeedbackModel implements TicketFeedbackModel {
  const factory _TicketFeedbackModel(
      {FeedbackTypeModel? feedbackType,
      String? remarks,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? createdAt,
      UserInfoModel? user}) = _$_TicketFeedbackModel;

  factory _TicketFeedbackModel.fromJson(Map<String, dynamic> json) =
      _$_TicketFeedbackModel.fromJson;

  @override
  FeedbackTypeModel? get feedbackType;
  @override
  String? get remarks;
  @override
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime? get createdAt;
  @override
  UserInfoModel? get user;
  @override
  @JsonKey(ignore: true)
  _$TicketFeedbackModelCopyWith<_TicketFeedbackModel> get copyWith =>
      throw _privateConstructorUsedError;
}
