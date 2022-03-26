// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticked_feedback_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TicketFeedbackModel _$$_TicketFeedbackModelFromJson(
        Map<String, dynamic> json) =>
    _$_TicketFeedbackModel(
      feedbackType: json['feedbackType'] == null
          ? null
          : FeedbackTypeModel.fromJson(
              json['feedbackType'] as Map<String, dynamic>),
      remarks: json['remarks'] as String? ?? "",
      createdAt: dateTimeFromJson(json['createdAt']),
    );

Map<String, dynamic> _$$_TicketFeedbackModelToJson(
        _$_TicketFeedbackModel instance) =>
    <String, dynamic>{
      'feedbackType': instance.feedbackType?.toJson(),
      'remarks': instance.remarks,
      'createdAt': dateTimeToJson(instance.createdAt),
    };
