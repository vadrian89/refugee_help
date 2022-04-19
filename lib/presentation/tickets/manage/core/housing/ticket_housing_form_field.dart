import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/domain/housing/housing_info_model.dart';
import 'package:refugee_help/domain/housing/housing_model.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/bottom_sheets/adaptive_bottom_sheet.dart';
import 'package:refugee_help/presentation/core/widgets/tiles/field_placeholder_tile.dart';
import 'package:refugee_help/presentation/core/widgets/text/form_error_text.dart';
import 'package:refugee_help/presentation/tickets/manage/core/housing/ticket_housing_sheet_body.dart';

import 'ticket_housing_info_tile.dart';

class TicketHousingFormField extends FormField<HousingInfoModel> {
  TicketHousingFormField({
    Key? key,
    HousingInfoModel? initialValue,
    FormFieldSetter<HousingInfoModel?>? onSaved,
    FormFieldValidator<HousingInfoModel?>? validator,
    AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction,
    bool editable = true,
    void Function(HousingInfoModel value)? onChanged,
  }) : super(
          key: ObjectKey(initialValue),
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          autovalidateMode: autovalidateMode,
          builder: (FormFieldState<HousingInfoModel?> state) => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TicketHousingFormFieldWidget(
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

class _TicketHousingFormFieldWidget extends StatelessWidget {
  final HousingInfoModel? value;
  final void Function(HousingInfoModel value) onChanged;
  final bool editable;

  const _TicketHousingFormFieldWidget({
    Key? key,
    this.value,
    required this.onChanged,
    this.editable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => (value == null)
      ? _placeholderTile(context)
      : TicketHousingInfoTile(
          info: value!,
          editable: editable,
          onPressed: () => _showSheet(context),
        );

  Widget _placeholderTile(BuildContext context) => FieldPlaceholderTile(
        leadingIcon: MdiIcons.home,
        label: "choose_housing".tr(),
        onPressed: () => _showSheet(context),
      );

  void _showSheet(BuildContext context) => AdaptiveBottomSheet(
        bodyChildren: const [TicketHousingSheetBody()],
        isScrollControlled: true,
        materialChildrenPadding: const EdgeInsets.symmetric(horizontal: 16),
        title: "choose_housing".tr(),
      ).show<HousingModel>(context).then((value) {
        (value != null) ? onChanged(HousingInfoModel.fromHousing(value)) : null;
      });
}
