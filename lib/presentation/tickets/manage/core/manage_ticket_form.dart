import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/tickets/manage/manage_ticket_cubit.dart';
import 'package:refugee_help/domain/tickets/ticket_model.dart';
import 'package:refugee_help/domain/tickets/ticket_status_model.dart';
import 'package:refugee_help/infrastructure/validators.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/dialogs/adaptive_dialog.dart';
import 'package:refugee_help/presentation/core/widgets/loader_widget.dart';
import 'package:refugee_help/presentation/core/widgets/text/head4_text.dart';
import 'package:refugee_help/presentation/core/widgets/text_fields/app_text_form_field.dart';
import 'package:refugee_help/presentation/core/widgets/refocus_background.dart';
import 'package:refugee_help/presentation/core/widgets/vertical_spacing.dart';
import 'package:refugee_help/presentation/tickets/manage/core/ticket_feedback_bottom_sheet.dart';
import 'package:refugee_help/presentation/tickets/manage/core/ticket_feedback_tile.dart';
import 'package:refugee_help/presentation/tickets/manage/core/ticket_status_button.dart';
import 'package:refugee_help/presentation/tickets/manage/core/ticket_transport_form_field.dart';
import 'manage_ticket_listener.dart';
import 'ticket_button_bar.dart';

class ManageTicketForm extends StatefulWidget {
  const ManageTicketForm({Key? key}) : super(key: key);

  @override
  State<ManageTicketForm> createState() => _ManageTicketFormState();
}

class _ManageTicketFormState extends State<ManageTicketForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TicketModel _ticket;
  bool editable = false;
  @override
  void initState() {
    super.initState();
    _ticket = context.read<ManageTicketCubit>().state.maybeWhen(
          orElse: () => TicketModel.newTicket(),
          edit: (ticket) => ticket,
          view: (ticket) => ticket,
        );
  }

  @override
  Widget build(_) => ManageTicketListener(
        onEdit: (ticket) => setState(() => _ticket = ticket),
        onView: (ticket) => setState(() => _ticket = ticket),
        child: RefocusBackground(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: _formBuilder,
            ),
          ),
        ),
      );

  Widget get _formBuilder => BlocBuilder<ManageTicketCubit, ManageTicketState>(
        builder: (context, state) {
          final isInitial = state.maybeWhen(orElse: () => false, initial: () => true);
          if (isInitial) {
            return const LoaderWidget();
          }
          editable = state.maybeWhen(orElse: () => false, edit: (_) => true);

          return Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              children: [
                if (_ticket.id == null) Head4Text(text: "new_ticket".tr()),
                const VerticalSpacing(20),
                ..._fields(),
                const VerticalSpacing(20),
                TicketButtonBar(
                  onCancel: () => (_ticket.id != null)
                      ? context.read<ManageTicketCubit>().toggleEdit()
                      : Navigator.maybePop(context),
                  onSave: () async {
                    if (!(_formKey.currentState?.validate() ?? false)) {
                      return await AdaptiveDialog.showError(
                        context,
                        message: "form_is_not_valid".tr(),
                      );
                    }

                    return AdaptiveDialog.showConfirmation(
                      context,
                      title: "ticket.save".tr(),
                      content: "ticket.save_confirm".tr(),
                      confirmText: "save".tr(),
                      cancelText: "cancel".tr(),
                    ).then((save) {
                      _formKey.currentState!.save();
                      save ? context.read<ManageTicketCubit>().save(_ticket) : null;
                    });
                  },
                ),
                const VerticalSpacing(40),
              ],
            ),
          );
        },
        buildWhen: (_, current) => current.maybeMap(
          orElse: () => false,
          view: (_) => true,
          edit: (_) => true,
        ),
      );

  List<Widget> _fields() => [
        AppTextFormField(
          initialValue: _ticket.adultsNumber?.toString(),
          hintText: "${"adults_number".tr()}*",
          validator: (val) => Validators.isInteger(val) ? null : "number_validator_fail".tr(),
          keyboardType: TextInputType.number,
          readOnly: !editable,
          onSaved: (val) => _ticket = _ticket.copyWith(adultsNumber: int.tryParse(val!)),
        ),
        AppTextFormField(
          initialValue: _ticket.childrenNumber?.toString(),
          hintText: "${"children_number".tr()}*",
          validator: (val) => Validators.isInteger(val) ? null : "number_validator_fail".tr(),
          keyboardType: TextInputType.number,
          readOnly: !editable,
          onSaved: (val) => _ticket = _ticket.copyWith(childrenNumber: int.tryParse(val!)),
        ),
        TicketTransportFormField(
          editable: editable,
          initialValue: _ticket.transport,
          validator: (val) => (val == null) ? "transport_is_required".tr() : null,
          onSaved: (val) => _ticket = _ticket.copyWith(transport: val),
        ),
        AppTextFormField(
          initialValue: _ticket.destination,
          hintText: "${"destination".tr()}*",
          validator: (val) => (val?.isNotEmpty ?? false) ? null : "field_empty_error".tr(),
          readOnly: !editable,
          onSaved: (val) => _ticket = _ticket.copyWith(destination: val),
        ),
        AppTextFormField(
          initialValue: _ticket.remarks,
          hintText: "remarks".tr(),
          readOnly: !editable,
          maxLines: 5,
          onSaved: (val) => _ticket = _ticket.copyWith(remarks: val),
        ),
        const VerticalSpacing(20),
        if (!editable)
          TicketStatusButton(
            status: _ticket.status,
            onChanged: (value) => _updateStatus(context, value),
          ),
        if (!editable && _ticket.feedback != null) TicketFeedbackTile(feedback: _ticket.feedback!),
      ];

  void _updateStatus(BuildContext context, [TicketStatusModel? status]) {
    if (status == null || status == TicketStatusModel.created() || _ticket.status == status) return;

    if (status == TicketStatusModel.finished() || status == TicketStatusModel.canceled()) {
      Navigator.maybePop(context);
      const TicketFeedbackBottomSheet().show(context).then((value) {
        if (value != null) {
          setState(() => _ticket = _ticket.updateStatus(status).updateFeedback(value));
          context.read<ManageTicketCubit>().updateStatus(_ticket);
        }
      });
    } else {
      setState(() => _ticket = _ticket.updateStatus(status));
      context.read<ManageTicketCubit>().updateStatus(_ticket);
    }
  }
}
