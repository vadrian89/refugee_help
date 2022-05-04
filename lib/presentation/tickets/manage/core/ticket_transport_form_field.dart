import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/domain/transport/transport_info_model.dart';
import 'package:refugee_help/domain/transport/transport_model.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/bottom_sheets/adaptive_bottom_sheet.dart';
import 'package:refugee_help/presentation/core/widgets/tiles/field_placeholder_tile.dart';
import 'package:refugee_help/presentation/core/widgets/text/form_error_text.dart';
import 'package:refugee_help/presentation/root_router/pop_result_listener.dart';

import 'transport/ticket_transport_info_tile.dart';
import 'transport/ticket_transport_sheet_body.dart';

class TicketTransportFormField extends FormField<TransportInfoModel> {
  final VoidCallback onSearch;

  TicketTransportFormField({
    Key? key,
    TransportInfoModel? initialValue,
    FormFieldSetter<TransportInfoModel?>? onSaved,
    FormFieldValidator<TransportInfoModel?>? validator,
    AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction,
    bool editable = true,
    ValueChanged<TransportInfoModel>? onChanged,
    required this.onSearch,
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
                onSearch: onSearch,
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
  final VoidCallback onSearch;

  const _TicketTransportFormFieldWidget({
    Key? key,
    this.value,
    required this.onChanged,
    this.editable = true,
    required this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => PopResultListener(
        onResultChanged: (result) {
          if (result is TransportModel) {
            onChanged(TransportInfoModel.fromTransport(result));
          }
        },
        child: (value == null)
            ? _placeholderTile(context)
            : TicketTransportInfoTile(
                info: value!,
                editable: editable,
                onPressed: onSearch,
              ),
      );

  Widget _placeholderTile(BuildContext context) => FieldPlaceholderTile(
        leadingIcon: MdiIcons.car,
        label: "choose_transport".tr(),
        onPressed: onSearch,
      );
}
