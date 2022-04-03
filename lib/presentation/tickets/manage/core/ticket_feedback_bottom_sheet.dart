import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:refugee_help/domain/tickets/ticked_feedback_model.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/bottom_sheets/adaptive_bottom_sheet.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/bottom_sheets/adaptive_sheet_long_action.dart';
import 'package:refugee_help/presentation/core/widgets/text_fields/app_text_form_field.dart';
import 'package:refugee_help/presentation/tickets/manage/core/ticket_feedback_type_field.dart';

class TicketFeedbackBottomSheet extends StatelessWidget {
  const TicketFeedbackBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();

  Future<TicketFeedbackModel?> show(BuildContext context) async {
    TicketFeedbackModel feedback = TicketFeedbackModel.noProblem();

    final save = await AdaptiveBottomSheet(
          title: "offer_feedback",
          isScrollControlled: true,
          bodyChildren: [
            TicketFeedbackTypeFormField(
              initialValue: feedback.feedbackType,
              onChanged: (value) => feedback = feedback.copyWith(feedbackType: value),
            ),
            Padding(
              padding: const EdgeInsets.all(26),
              child: AppTextFormField(
                hintText: "remarks".tr(),
                maxLines: 5,
                onChanged: (val) => feedback = feedback.copyWith(remarks: val.trim()),
              ),
            )
          ],
          actions: [
            AdaptiveSheetLongAction(
              child: Text("save".tr()),
              onPressed: () => Navigator.maybePop(context, true),
            ),
          ],
        ).show<bool?>(context) ??
        false;
    if (save) {
      return feedback;
    }
    return null;
  }
}
