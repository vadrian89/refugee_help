import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HousingPeriodDropdown extends StatelessWidget {
  final ValueChanged<int?>? onChanged;
  final int value;

  const HousingPeriodDropdown({
    Key? key,
    this.value = 1,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => DropdownButton<int>(
        isExpanded: true,
        hint: Text("housing_period".tr()),
        value: value,
        items: [
          _item(
            context,
            title: "short_period".tr(),
            value: 1,
          ),
          _item(
            context,
            title: "long_period".tr(),
            value: 2,
          ),
        ],
        onChanged: onChanged,
        itemHeight: 80,
      );

  DropdownMenuItem<int> _item(
    BuildContext context, {
    required String title,
    required int value,
  }) =>
      DropdownMenuItem(
        child: ListTile(title: Text(title)),
        value: value,
      );
}
