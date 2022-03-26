// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TicketModel _$$_TicketModelFromJson(Map<String, dynamic> json) =>
    _$_TicketModel(
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
      ticketFeedback: json['ticketFeedback'] == null
          ? null
          : TicketFeedbackModel.fromJson(
              json['ticketFeedback'] as Map<String, dynamic>),
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$$_TicketModelToJson(_$_TicketModel instance) =>
    <String, dynamic>{
      'adultsNumber': instance.adultsNumber,
      'childrenNumber': instance.childrenNumber,
      'transport': instance.transport?.toJson(),
      'dispatcher': instance.dispatcher?.toJson(),
      'destination': instance.destination,
      'createdAt': dateTimeToJson(instance.createdAt),
      'startedAt': dateTimeToJson(instance.startedAt),
      'cancelFeedback': instance.cancelFeedback?.toJson(),
      'ticketFeedback': instance.ticketFeedback?.toJson(),
      'remarks': instance.remarks,
    };
