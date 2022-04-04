// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TicketModel _$$_TicketModelFromJson(Map<String, dynamic> json) =>
    _$_TicketModel(
      type: json['type'] == null
          ? null
          : TicketTypeModel.fromJson(json['type'] as Map<String, dynamic>),
      adultsNumber: json['adultsNumber'] as int?,
      childrenNumber: json['childrenNumber'] as int?,
      transport: json['transport'] == null
          ? null
          : TransportInfoModel.fromJson(
              json['transport'] as Map<String, dynamic>),
      dispatcher: json['dispatcher'] == null
          ? null
          : UserInfoModel.fromJson(json['dispatcher'] as Map<String, dynamic>),
      destination: json['destination'] as String?,
      createdAt: dateTimeFromJson(json['createdAt']),
      startedAt: dateTimeFromJson(json['startedAt']),
      cancelFeedback: json['cancelFeedback'] == null
          ? null
          : TicketFeedbackModel.fromJson(
              json['cancelFeedback'] as Map<String, dynamic>),
      finishedFeedback: json['finishedFeedback'] == null
          ? null
          : TicketFeedbackModel.fromJson(
              json['finishedFeedback'] as Map<String, dynamic>),
      remarks: json['remarks'] as String?,
      isMock: json['isMock'] as bool? ?? false,
    );

Map<String, dynamic> _$$_TicketModelToJson(_$_TicketModel instance) =>
    <String, dynamic>{
      'type': instance.type?.toJson(),
      'adultsNumber': instance.adultsNumber,
      'childrenNumber': instance.childrenNumber,
      'transport': instance.transport?.toJson(),
      'dispatcher': instance.dispatcher?.toJson(),
      'destination': instance.destination,
      'createdAt': dateTimeToJson(instance.createdAt),
      'startedAt': dateTimeToJson(instance.startedAt),
      'cancelFeedback': instance.cancelFeedback?.toJson(),
      'finishedFeedback': instance.finishedFeedback?.toJson(),
      'remarks': instance.remarks,
      'isMock': instance.isMock,
    };
