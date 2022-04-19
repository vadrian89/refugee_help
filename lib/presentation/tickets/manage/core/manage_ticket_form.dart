import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/tickets/manage/manage_ticket_cubit.dart';
import 'package:refugee_help/domain/tickets/ticket_model.dart';
import 'package:refugee_help/domain/tickets/ticket_status_model.dart';
import 'package:refugee_help/domain/tickets/ticket_type_model.dart';
import 'package:refugee_help/infrastructure/validators.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/dialogs/adaptive_dialog.dart';
import 'package:refugee_help/presentation/core/widgets/constrained_form.dart';
import 'package:refugee_help/presentation/core/widgets/text/head4_text.dart';
import 'package:refugee_help/presentation/core/widgets/text_fields/app_text_form_field.dart';
import 'package:refugee_help/presentation/core/widgets/vertical_spacing.dart';
import 'package:refugee_help/presentation/tickets/manage/core/ticket_feedback_bottom_sheet.dart';
import 'package:refugee_help/presentation/tickets/manage/core/ticket_feedback_tile.dart';
import 'package:refugee_help/presentation/tickets/manage/core/ticket_status_button.dart';
import 'package:refugee_help/presentation/tickets/manage/core/ticket_transport_form_field.dart';
import 'housing/ticket_housing_form_field.dart';
import 'manage_ticket_consumer.dart';
import 'ticket_button_bar.dart';

class ManageTicketForm extends StatefulWidget {
  const ManageTicketForm({Key? key}) : super(key: key);

  @override
  State<ManageTicketForm> createState() => _ManageTicketFormState();
}

class _ManageTicketFormState extends State<ManageTicketForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final ManageTicketCubit _bloc;
  late TicketModel _ticket;
  bool _editable = false;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<ManageTicketCubit>();
    _ticket = _bloc.state.maybeWhen(
      orElse: () => TicketModel.newTicket(),
      edit: (ticket) => ticket,
      view: (ticket) => ticket,
    );
  }

  @override
  Widget build(_) => ManageTicketConsumer(
        builder: (context, ticket, editable) {
          _editable = editable;
          _ticket = ticket ?? _ticket;

          return ConstrainedForm(
            formKey: _formKey,
            children: [
              if (_ticket.id == null) Head4Text(text: "new_ticket".tr()),
              const VerticalSpacing(20),
              ..._fields(context),
              TicketButtonBar(
                onCancel: () =>
                    (_ticket.id != null) ? _bloc.toggleEdit() : Navigator.maybePop(context),
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
                    save ? _bloc.save(_ticket) : null;
                  });
                },
              ),
            ],
          );
        },
      );

  List<Widget> _fields(BuildContext context) => [
        AppTextFormField(
          initialValue: _ticket.adultsNumber?.toString(),
          hintText: "${"adults_number".tr()}*",
          validator: (val) => Validators.isInteger(val) ? null : "number_validator_fail".tr(),
          keyboardType: TextInputType.number,
          readOnly: !_editable,
          onSaved: (val) => _ticket = _ticket.copyWith(adultsNumber: int.tryParse(val!)),
        ),
        AppTextFormField(
          initialValue: _ticket.childrenNumber?.toString(),
          hintText: "${"children_number".tr()}*",
          validator: (val) => Validators.isInteger(val) ? null : "number_validator_fail".tr(),
          keyboardType: TextInputType.number,
          readOnly: !_editable,
          onSaved: (val) => _ticket = _ticket.copyWith(childrenNumber: int.tryParse(val!)),
        ),
        ..._transportSpecificFields(context),
        ..._housingSpecificFields(context),
        AppTextFormField(
          initialValue: _ticket.remarks,
          hintText: "remarks".tr(),
          readOnly: !_editable,
          maxLines: 5,
          onSaved: (val) => _ticket = _ticket.copyWith(remarks: val),
        ),
        const VerticalSpacing(20),
        if (!_editable)
          TicketStatusButton(
            status: _ticket.status,
            onChanged: (value) => _updateStatus(context, value),
          ),
        if (!_editable && _ticket.feedback != null) TicketFeedbackTile(feedback: _ticket.feedback!),
      ];

  List<Widget> _transportSpecificFields(BuildContext context) {
    if (_ticket.type != TicketTypeModel.transport()) {
      return [];
    }
    return [
      TicketTransportFormField(
        editable: _editable,
        initialValue: _ticket.transport,
        validator: (val) => (val == null) ? "transport_is_required".tr() : null,
        onSaved: (val) => _ticket = _ticket.copyWith(transport: val),
      ),
      AppTextFormField(
        initialValue: _ticket.destination,
        hintText: "${"destination".tr()}*",
        validator: (val) => (val?.isNotEmpty ?? false) ? null : "field_empty_error".tr(),
        readOnly: !_editable,
        onSaved: (val) => _ticket = _ticket.copyWith(destination: val),
      ),
    ];
  }

  List<Widget> _housingSpecificFields(BuildContext context) {
    if (_ticket.type != TicketTypeModel.housing()) {
      return [];
    }
    return [
      TicketHousingFormField(
        editable: _editable,
        initialValue: _ticket.housing,
        validator: (val) => (val == null) ? "housing_is_required".tr() : null,
        onSaved: (val) => _ticket = _ticket.copyWith(housing: val),
      ),
    ];
  }

  void _updateStatus(BuildContext context, [TicketStatusModel? status]) {
    if (status == null || status == TicketStatusModel.created() || _ticket.status == status) return;

    if (status == TicketStatusModel.finished() || status == TicketStatusModel.canceled()) {
      Navigator.maybePop(context);
      const TicketFeedbackBottomSheet().show(context).then((value) {
        if (value != null) {
          setState(() => _ticket = _ticket.updateStatus(status).updateFeedback(value));
          _bloc.updateStatus(_ticket);
        }
      });
    } else {
      setState(() => _ticket = _ticket.updateStatus(status));
      _bloc.updateStatus(_ticket);
    }
  }
}
