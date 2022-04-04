// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:refugee_help/domain/transport/transport_info_model.dart';
import 'package:refugee_help/domain/transport/transport_model.dart';
import 'package:refugee_help/domain/user/user_info_model.dart';
import 'package:refugee_help/domain/util/json_util.dart';

import 'ticked_feedback_model.dart';
import 'ticket_status_model.dart';
import 'ticket_type_model.dart';

part 'ticket_model.g.dart';
part 'ticket_model.freezed.dart';

@freezed
class TicketModel with _$TicketModel {
  TicketFeedbackModel? get feedback => cancelFeedback ?? finishedFeedback;

  const TicketModel._();

  @JsonSerializable(explicitToJson: true)
  const factory TicketModel({
    @JsonKey(ignore: true) String? id,
    TicketTypeModel? type,
    int? adultsNumber,
    int? childrenNumber,
    TransportInfoModel? transport,

    /// User which created the ticket.
    UserInfoModel? dispatcher,
    String? destination,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime? createdAt,
    @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime? startedAt,
    TicketFeedbackModel? cancelFeedback,
    TicketFeedbackModel? finishedFeedback,
    String? remarks,

    /// For development purposes.
    @Default(false) bool? isMock,
  }) = _TicketModel;

  factory TicketModel.newTicket([TicketTypeModel? type]) => TicketModel(
        type: type ?? TicketTypeModel.transport(),
        createdAt: DateTime.now(),
      );

  factory TicketModel.fromJson(Map<String, dynamic> json) => _$TicketModelFromJson(json);

  TicketModel updateStatus(TicketStatusModel status) {
    if (status == TicketStatusModel.started()) {
      return copyWith(
        startedAt: DateTime.now(),
        finishedFeedback: null,
        cancelFeedback: null,
      );
    } else if (status == TicketStatusModel.finished()) {
      return copyWith(finishedFeedback: TicketFeedbackModel.noProblem());
    } else if (status == TicketStatusModel.canceled()) {
      return copyWith(
        finishedFeedback: null,
        cancelFeedback: TicketFeedbackModel.noProblem(),
      );
    }
    return this;
  }

  TicketModel updateFeedback(TicketFeedbackModel feedback) => copyWith(
        cancelFeedback: status == TicketStatusModel.canceled() ? feedback : null,
        finishedFeedback: status == TicketStatusModel.finished() ? feedback : null,
      );

  TicketStatusModel get status {
    if (finishedFeedback != null) {
      return TicketStatusModel.finished();
    }
    if (cancelFeedback != null) {
      return TicketStatusModel.canceled();
    }
    if (startedAt != null) {
      return TicketStatusModel.started();
    }
    return TicketStatusModel.created();
  }

  TransportModel get unavailableTransport => transport!.toTransport.copyWith(
        isAvailable: false,
        updatedAt: DateTime.now(),
      );
}
