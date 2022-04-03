import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/domain/transport/transport_info_model.dart';
import 'package:refugee_help/domain/transport/transport_model.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/bottom_sheets/adaptive_bottom_sheet.dart';
import 'package:refugee_help/presentation/core/widgets/tiles/field_placeholder_tile.dart';
import 'package:refugee_help/presentation/core/widgets/text/form_error_text.dart';

import 'transport/ticket_transport_info_tile.dart';
import 'transport/ticket_transport_sheet_body.dart';

class TicketTransportFormField extends FormField<TransportInfoModel> {
  TicketTransportFormField({
    Key? key,
    TransportInfoModel? initialValue,
    FormFieldSetter<TransportInfoModel?>? onSaved,
    FormFieldValidator<TransportInfoModel?>? validator,
    AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction,
    bool editable = true,
    void Function(TransportInfoModel value)? onChanged,
  }) : super(
          key: ObjectKey(initialValue),
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          autovalidateMode: autovalidateMode,
          builder: (FormFieldState<TransportInfoModel?> state) => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TicketTransportFormFieldWidget(
                editable: editable,
                value: state.value,
                onChanged: (value) {
                  state.didChange(value);
                  if (onChanged != null) {
                    onChanged(value);
                  }
                },
              ),
              if (state.hasError) FormErrorText(text: state.errorText ?? ""),
            ],
          ),
        );
}

class _TicketTransportFormFieldWidget extends StatelessWidget {
  final TransportInfoModel? value;
  final void Function(TransportInfoModel value) onChanged;
  final bool editable;

  const _TicketTransportFormFieldWidget({
    Key? key,
    this.value,
    required this.onChanged,
    this.editable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => (value == null)
      ? _placeholderTile(context)
      : TicketTransportInfoTile(
          info: value!,
          editable: editable,
          onPressed: () => _showTransportSheet(context),
        );

  Widget _placeholderTile(BuildContext context) => FieldPlaceholderTile(
        leadingIcon: MdiIcons.car,
        label: "choose_transport".tr(),
        onPressed: () => _showTransportSheet(context),
      );

  void _showTransportSheet(BuildContext context) => AdaptiveBottomSheet(
        bodyChildren: const [TicketTransportSheetBody()],
        isScrollControlled: true,
        materialChildrenPadding: const EdgeInsets.symmetric(horizontal: 16),
        title: "choose_transport".tr(),
      ).show<TransportModel>(context).then((value) {
        (value != null) ? onChanged(TransportInfoModel.fromTransport(value)) : null;
      });
}
