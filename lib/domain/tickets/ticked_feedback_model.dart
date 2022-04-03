// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:refugee_help/domain/user/user_info_model.dart';
import 'package:refugee_help/domain/util/json_util.dart';

import 'feedback_type_model.dart';

part 'ticked_feedback_model.g.dart';
part 'ticked_feedback_model.freezed.dart';

@freezed
class TicketFeedbackModel with _$TicketFeedbackModel {
  @JsonSerializable(explicitToJson: true)
  const factory TicketFeedbackModel({
    FeedbackTypeModel? feedbackType,
    @Default("") String? remarks,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime? createdAt,
    UserInfoModel? user,
  }) = _TicketFeedbackModel;

  factory TicketFeedbackModel.noProblem() => TicketFeedbackModel(
        feedbackType: FeedbackTypeModel.noProblem(),
        createdAt: DateTime.now(),
      );

  factory TicketFeedbackModel.fromJson(Map<String, dynamic> json) =>
      _$TicketFeedbackModelFromJson(json);
}
