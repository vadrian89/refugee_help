import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:refugee_help/domain/transport/transport_type_model.dart';

class TransportTypeDropdown extends StatelessWidget {
  final List<TransportTypeModel> list;
  final void Function(TransportTypeModel? type)? onChanged;
  final TransportTypeModel? value;

  const TransportTypeDropdown({
    Key? key,
    this.value,
    required this.list,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => DropdownButton<TransportTypeModel>(
        hint: Text("transport_type".tr()),
        value: value,
        items: _items(context),
        onChanged: onChanged,
        itemHeight: 80,
      );

  List<DropdownMenuItem<TransportTypeModel>> _items(BuildContext context) => List.generate(
        list.length,
        (index) => _item(context, model: list[index]),
      );

  DropdownMenuItem<TransportTypeModel> _item(
    BuildContext context, {
    required TransportTypeModel model,
  }) =>
      DropdownMenuItem(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(child: Icon(model.icon)),
            title: Text(model.name),
            subtitle: Text(model.seats),
          ),
        ),
        value: model,
      );
}
