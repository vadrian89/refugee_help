// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ticket_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TicketModel _$TicketModelFromJson(Map<String, dynamic> json) {
  return _TicketModel.fromJson(json);
}

/// @nodoc
class _$TicketModelTearOff {
  const _$TicketModelTearOff();

  _TicketModel call(
      {@JsonKey(ignore: true)
          String? id,
      int? adultsNumber,
      int? childrenNumber,
      TransportInfoModel? transport,
      UserInfoModel? dispatcher,
      String? destination,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? createdAt,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? startedAt,
      TicketFeedbackModel? cancelFeedback,
      TicketFeedbackModel? ticketFeedback,
      String? remarks}) {
    return _TicketModel(
      id: id,
      adultsNumber: adultsNumber,
      childrenNumber: childrenNumber,
      transport: transport,
      dispatcher: dispatcher,
      destination: destination,
      createdAt: createdAt,
      startedAt: startedAt,
      cancelFeedback: cancelFeedback,
      ticketFeedback: ticketFeedback,
      remarks: remarks,
    );
  }

  TicketModel fromJson(Map<String, Object?> json) {
    return TicketModel.fromJson(json);
  }
}

/// @nodoc
const $TicketModel = _$TicketModelTearOff();

/// @nodoc
mixin _$TicketModel {
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  int? get adultsNumber => throw _privateConstructorUsedError;
  int? get childrenNumber => throw _privateConstructorUsedError;
  TransportInfoModel? get transport => throw _privateConstructorUsedError;

  /// User which created the ticket.
  UserInfoModel? get dispatcher => throw _privateConstructorUsedError;
  String? get destination => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime? get startedAt => throw _privateConstructorUsedError;
  TicketFeedbackModel? get cancelFeedback => throw _privateConstructorUsedError;
  TicketFeedbackModel? get ticketFeedback => throw _privateConstructorUsedError;
  String? get remarks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketModelCopyWith<TicketModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketModelCopyWith<$Res> {
  factory $TicketModelCopyWith(
          TicketModel value, $Res Function(TicketModel) then) =
      _$TicketModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true)
          String? id,
      int? adultsNumber,
      int? childrenNumber,
      TransportInfoModel? transport,
      UserInfoModel? dispatcher,
      String? destination,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? createdAt,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? startedAt,
      TicketFeedbackModel? cancelFeedback,
      TicketFeedbackModel? ticketFeedback,
      String? remarks});

  $TransportInfoModelCopyWith<$Res>? get transport;
  $UserInfoModelCopyWith<$Res>? get dispatcher;
  $TicketFeedbackModelCopyWith<$Res>? get cancelFeedback;
  $TicketFeedbackModelCopyWith<$Res>? get ticketFeedback;
}

/// @nodoc
class _$TicketModelCopyWithImpl<$Res> implements $TicketModelCopyWith<$Res> {
  _$TicketModelCopyWithImpl(this._value, this._then);

  final TicketModel _value;
  // ignore: unused_field
  final $Res Function(TicketModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? adultsNumber = freezed,
    Object? childrenNumber = freezed,
    Object? transport = freezed,
    Object? dispatcher = freezed,
    Object? destination = freezed,
    Object? createdAt = freezed,
    Object? startedAt = freezed,
    Object? cancelFeedback = freezed,
    Object? ticketFeedback = freezed,
    Object? remarks = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      adultsNumber: adultsNumber == freezed
          ? _value.adultsNumber
          : adultsNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      childrenNumber: childrenNumber == freezed
          ? _value.childrenNumber
          : childrenNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      transport: transport == freezed
          ? _value.transport
          : transport // ignore: cast_nullable_to_non_nullable
              as TransportInfoModel?,
      dispatcher: dispatcher == freezed
          ? _value.dispatcher
          : dispatcher // ignore: cast_nullable_to_non_nullable
              as UserInfoModel?,
      destination: destination == freezed
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startedAt: startedAt == freezed
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cancelFeedback: cancelFeedback == freezed
          ? _value.cancelFeedback
          : cancelFeedback // ignore: cast_nullable_to_non_nullable
              as TicketFeedbackModel?,
      ticketFeedback: ticketFeedback == freezed
          ? _value.ticketFeedback
          : ticketFeedback // ignore: cast_nullable_to_non_nullable
              as TicketFeedbackModel?,
      remarks: remarks == freezed
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $TransportInfoModelCopyWith<$Res>? get transport {
    if (_value.transport == null) {
      return null;
    }

    return $TransportInfoModelCopyWith<$Res>(_value.transport!, (value) {
      return _then(_value.copyWith(transport: value));
    });
  }

  @override
  $UserInfoModelCopyWith<$Res>? get dispatcher {
    if (_value.dispatcher == null) {
      return null;
    }

    return $UserInfoModelCopyWith<$Res>(_value.dispatcher!, (value) {
      return _then(_value.copyWith(dispatcher: value));
    });
  }

  @override
  $TicketFeedbackModelCopyWith<$Res>? get cancelFeedback {
    if (_value.cancelFeedback == null) {
      return null;
    }

    return $TicketFeedbackModelCopyWith<$Res>(_value.cancelFeedback!, (value) {
      return _then(_value.copyWith(cancelFeedback: value));
    });
  }

  @override
  $TicketFeedbackModelCopyWith<$Res>? get ticketFeedback {
    if (_value.ticketFeedback == null) {
      return null;
    }

    return $TicketFeedbackModelCopyWith<$Res>(_value.ticketFeedback!, (value) {
      return _then(_value.copyWith(ticketFeedback: value));
    });
  }
}

/// @nodoc
abstract class _$TicketModelCopyWith<$Res>
    implements $TicketModelCopyWith<$Res> {
  factory _$TicketModelCopyWith(
          _TicketModel value, $Res Function(_TicketModel) then) =
      __$TicketModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true)
          String? id,
      int? adultsNumber,
      int? childrenNumber,
      TransportInfoModel? transport,
      UserInfoModel? dispatcher,
      String? destination,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? createdAt,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? startedAt,
      TicketFeedbackModel? cancelFeedback,
      TicketFeedbackModel? ticketFeedback,
      String? remarks});

  @override
  $TransportInfoModelCopyWith<$Res>? get transport;
  @override
  $UserInfoModelCopyWith<$Res>? get dispatcher;
  @override
  $TicketFeedbackModelCopyWith<$Res>? get cancelFeedback;
  @override
  $TicketFeedbackModelCopyWith<$Res>? get ticketFeedback;
}

/// @nodoc
class __$TicketModelCopyWithImpl<$Res> extends _$TicketModelCopyWithImpl<$Res>
    implements _$TicketModelCopyWith<$Res> {
  __$TicketModelCopyWithImpl(
      _TicketModel _value, $Res Function(_TicketModel) _then)
      : super(_value, (v) => _then(v as _TicketModel));

  @override
  _TicketModel get _value => super._value as _TicketModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? adultsNumber = freezed,
    Object? childrenNumber = freezed,
    Object? transport = freezed,
    Object? dispatcher = freezed,
    Object? destination = freezed,
    Object? createdAt = freezed,
    Object? startedAt = freezed,
    Object? cancelFeedback = freezed,
    Object? ticketFeedback = freezed,
    Object? remarks = freezed,
  }) {
    return _then(_TicketModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      adultsNumber: adultsNumber == freezed
          ? _value.adultsNumber
          : adultsNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      childrenNumber: childrenNumber == freezed
          ? _value.childrenNumber
          : childrenNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      transport: transport == freezed
          ? _value.transport
          : transport // ignore: cast_nullable_to_non_nullable
              as TransportInfoModel?,
      dispatcher: dispatcher == freezed
          ? _value.dispatcher
          : dispatcher // ignore: cast_nullable_to_non_nullable
              as UserInfoModel?,
      destination: destination == freezed
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startedAt: startedAt == freezed
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cancelFeedback: cancelFeedback == freezed
          ? _value.cancelFeedback
          : cancelFeedback // ignore: cast_nullable_to_non_nullable
              as TicketFeedbackModel?,
      ticketFeedback: ticketFeedback == freezed
          ? _value.ticketFeedback
          : ticketFeedback // ignore: cast_nullable_to_non_nullable
              as TicketFeedbackModel?,
      remarks: remarks == freezed
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_TicketModel extends _TicketModel {
  const _$_TicketModel(
      {@JsonKey(ignore: true)
          this.id,
      this.adultsNumber,
      this.childrenNumber,
      this.transport,
      this.dispatcher,
      this.destination,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          this.createdAt,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          this.startedAt,
      this.cancelFeedback,
      this.ticketFeedback,
      this.remarks})
      : super._();

  factory _$_TicketModel.fromJson(Map<String, dynamic> json) =>
      _$$_TicketModelFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final int? adultsNumber;
  @override
  final int? childrenNumber;
  @override
  final TransportInfoModel? transport;
  @override

  /// User which created the ticket.
  final UserInfoModel? dispatcher;
  @override
  final String? destination;
  @override
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime? createdAt;
  @override
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime? startedAt;
  @override
  final TicketFeedbackModel? cancelFeedback;
  @override
  final TicketFeedbackModel? ticketFeedback;
  @override
  final String? remarks;

  @override
  String toString() {
    return 'TicketModel(id: $id, adultsNumber: $adultsNumber, childrenNumber: $childrenNumber, transport: $transport, dispatcher: $dispatcher, destination: $destination, createdAt: $createdAt, startedAt: $startedAt, cancelFeedback: $cancelFeedback, ticketFeedback: $ticketFeedback, remarks: $remarks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TicketModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.adultsNumber, adultsNumber) &&
            const DeepCollectionEquality()
                .equals(other.childrenNumber, childrenNumber) &&
            const DeepCollectionEquality().equals(other.transport, transport) &&
            const DeepCollectionEquality()
                .equals(other.dispatcher, dispatcher) &&
            const DeepCollectionEquality()
                .equals(other.destination, destination) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.startedAt, startedAt) &&
            const DeepCollectionEquality()
                .equals(other.cancelFeedback, cancelFeedback) &&
            const DeepCollectionEquality()
                .equals(other.ticketFeedback, ticketFeedback) &&
            const DeepCollectionEquality().equals(other.remarks, remarks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(adultsNumber),
      const DeepCollectionEquality().hash(childrenNumber),
      const DeepCollectionEquality().hash(transport),
      const DeepCollectionEquality().hash(dispatcher),
      const DeepCollectionEquality().hash(destination),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(startedAt),
      const DeepCollectionEquality().hash(cancelFeedback),
      const DeepCollectionEquality().hash(ticketFeedback),
      const DeepCollectionEquality().hash(remarks));

  @JsonKey(ignore: true)
  @override
  _$TicketModelCopyWith<_TicketModel> get copyWith =>
      __$TicketModelCopyWithImpl<_TicketModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TicketModelToJson(this);
  }
}

abstract class _TicketModel extends TicketModel {
  const factory _TicketModel(
      {@JsonKey(ignore: true)
          String? id,
      int? adultsNumber,
      int? childrenNumber,
      TransportInfoModel? transport,
      UserInfoModel? dispatcher,
      String? destination,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? createdAt,
      @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
          DateTime? startedAt,
      TicketFeedbackModel? cancelFeedback,
      TicketFeedbackModel? ticketFeedback,
      String? remarks}) = _$_TicketModel;
  const _TicketModel._() : super._();

  factory _TicketModel.fromJson(Map<String, dynamic> json) =
      _$_TicketModel.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id;
  @override
  int? get adultsNumber;
  @override
  int? get childrenNumber;
  @override
  TransportInfoModel? get transport;
  @override

  /// User which created the ticket.
  UserInfoModel? get dispatcher;
  @override
  String? get destination;
  @override
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime? get createdAt;
  @override
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime? get startedAt;
  @override
  TicketFeedbackModel? get cancelFeedback;
  @override
  TicketFeedbackModel? get ticketFeedback;
  @override
  String? get remarks;
  @override
  @JsonKey(ignore: true)
  _$TicketModelCopyWith<_TicketModel> get copyWith =>
      throw _privateConstructorUsedError;
}
