import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:refugee_help/domain/tickets/feedback_type_model.dart';

class FeedbackTypeDropdown extends StatelessWidget {
  final List<FeedbackTypeModel> list;
  final void Function(FeedbackTypeModel? type)? onChanged;
  final FeedbackTypeModel? value;

  const FeedbackTypeDropdown({
    Key? key,
    this.value,
    required this.list,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => DropdownButton<FeedbackTypeModel>(
        hint: Text("feedback_type".tr()),
        value: value,
        items: _items(context),
        onChanged: onChanged,
        itemHeight: 80,
      );

  List<DropdownMenuItem<FeedbackTypeModel>> _items(BuildContext context) => List.generate(
        list.length,
        (index) => _item(context, type: list[index]),
      );

  DropdownMenuItem<FeedbackTypeModel> _item(
    BuildContext context, {
    required FeedbackTypeModel type,
  }) =>
      DropdownMenuItem(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(child: Icon(type.icon)),
            title: Text(type.name),
          ),
        ),
        value: type,
      );
}
