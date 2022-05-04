import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:refugee_help/domain/housing/housing_type_model.dart';

class HousingTypeDropdown extends StatelessWidget {
  final HousingTypeModel? value;
  final ValueChanged<HousingTypeModel?>? onChanged;
  final bool enableAll;

  List<HousingTypeModel> get _list => List.from([
        if (enableAll) HousingTypeModel.all(),
        ...HousingTypeModel.list,
      ]);

  const HousingTypeDropdown({
    Key? key,
    this.value,
    required this.onChanged,
    this.enableAll = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => DropdownButton<HousingTypeModel>(
        isExpanded: true,
        hint: Text("housing_type".tr()),
        value: value,
        items: _items(context),
        onChanged: onChanged,
        itemHeight: 80,
      );

  List<DropdownMenuItem<HousingTypeModel>> _items(BuildContext context) => List.generate(
        _list.length,
        (index) => _item(context, model: _list[index]),
      );

  DropdownMenuItem<HousingTypeModel> _item(
    BuildContext context, {
    required HousingTypeModel model,
  }) =>
      DropdownMenuItem(
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(child: Icon(model.icon)),
          title: Text(model.name),
        ),
        value: model,
      );
}
