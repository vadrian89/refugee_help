import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:refugee_help/domain/transport/transport_type_model.dart';

class TransportTypeDropdown extends StatelessWidget {
  final void Function(TransportTypeModel? type)? onChanged;
  final TransportTypeModel? value;
  final bool enableAll;

  List<TransportTypeModel> get _list => List.from([
        if (enableAll) TransportTypeModel.all(),
        ...TransportTypeModel.list,
      ]);

  const TransportTypeDropdown({
    Key? key,
    this.value,
    required this.onChanged,
    this.enableAll = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => DropdownButton<TransportTypeModel>(
        isExpanded: true,
        hint: Text("transport_type".tr()),
        value: value,
        items: _items(context),
        onChanged: onChanged,
        itemHeight: 80,
      );

  List<DropdownMenuItem<TransportTypeModel>> _items(BuildContext context) => List.generate(
        _list.length,
        (index) => _item(context, model: _list[index]),
      );

  DropdownMenuItem<TransportTypeModel> _item(
    BuildContext context, {
    required TransportTypeModel model,
  }) =>
      DropdownMenuItem(
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(child: Icon(model.icon)),
          title: Text(model.name),
          subtitle: Text(model.seats),
        ),
        value: model,
      );
}
