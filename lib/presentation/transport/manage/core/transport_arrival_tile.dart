import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:refugee_help/infrastructure/validators.dart';
import 'package:refugee_help/presentation/core/widgets/text_fields/app_text_form_field.dart';

class TransportArrivalTile extends StatelessWidget {
  final TextEditingController textController;
  final bool readOnly;
  final bool atLocation;
  final void Function(bool? atLocation)? onAtLocationChanged;

  const TransportArrivalTile({
    Key? key,
    required this.textController,
    required this.readOnly,
    this.atLocation = true,
    required this.onAtLocationChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        minLeadingWidth: 0,
        contentPadding: EdgeInsets.zero,
        title: SwitchListTile.adaptive(
          title: Text("${"at_location".tr()}?"),
          subtitle: Text(atLocation ? "yes".tr() : "no".tr()),
          value: atLocation,
          onChanged: onAtLocationChanged,
          contentPadding: EdgeInsets.zero,
        ),
        subtitle: Visibility(
          visible: !atLocation,
          child: AppTextFormField(
            controller: textController,
            hintText: "${"hours_arrival".tr()}*",
            autovalidateMode: AutovalidateMode.always,
            validator: (val) => Validators.isInteger(val) ? null : "number_validator_fail".tr(),
            keyboardType: TextInputType.number,
            readOnly: readOnly,
          ),
        ),
      );
}
