import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/domain/housing/housing_info_model.dart';
import 'package:refugee_help/domain/housing/housing_model.dart';
import 'package:refugee_help/presentation/core/widgets/tiles/field_placeholder_tile.dart';
import 'package:refugee_help/presentation/core/widgets/text/form_error_text.dart';
import 'package:refugee_help/presentation/root_router/pop_result_listener.dart';

import 'ticket_housing_info_tile.dart';

class TicketHousingFormField extends FormField<HousingInfoModel> {
  final VoidCallback onSearchHousing;

  TicketHousingFormField({
    Key? key,
    HousingInfoModel? initialValue,
    FormFieldSetter<HousingInfoModel?>? onSaved,
    FormFieldValidator<HousingInfoModel?>? validator,
    AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction,
    bool editable = true,
    void Function(HousingInfoModel value)? onChanged,
    required this.onSearchHousing,
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
                onSearchHousing: onSearchHousing,
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
  final VoidCallback onSearchHousing;

  const _TicketHousingFormFieldWidget({
    Key? key,
    this.value,
    required this.onChanged,
    this.editable = true,
    required this.onSearchHousing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => PopResultListener(
        onResultChanged: (result) {
          if (result is HousingModel) {
            onChanged(HousingInfoModel.fromHousing(result));
          }
        },
        child: (value == null)
            ? _placeholderTile(context)
            : TicketHousingInfoTile(
                info: value!,
                editable: editable,
                onPressed: onSearchHousing,
              ),
      );

  Widget _placeholderTile(BuildContext context) => FieldPlaceholderTile(
        leadingIcon: MdiIcons.home,
        label: "choose_housing".tr(),
        onPressed: onSearchHousing,
      );
}
