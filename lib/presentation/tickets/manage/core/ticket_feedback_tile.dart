import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:refugee_help/domain/tickets/ticked_feedback_model.dart';
import 'package:refugee_help/infrastructure/utils.dart';
import 'package:refugee_help/presentation/core/widgets/vertical_spacing.dart';

class TicketFeedbackTile extends StatelessWidget {
  final TicketFeedbackModel feedback;

  const TicketFeedbackTile({Key? key, required this.feedback}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListTile(
          leading: CircleAvatar(child: Icon(feedback.feedbackType!.icon)),
          title: Text(feedback.remarks!.isEmpty ? "no_remark_feedback".tr() : feedback.remarks!),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpacing(),
              Text("${"user".tr()}: ${feedback.user?.fullName ?? ""}"),
              const VerticalSpacing(),
              Text("${"date".tr()}: ${Utils.globalDateFormat.format(feedback.createdAt!)}"),
            ],
          ),
          contentPadding: EdgeInsets.zero,
        ),
      );
}
