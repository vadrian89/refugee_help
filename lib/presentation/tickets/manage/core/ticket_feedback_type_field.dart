import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:refugee_help/domain/tickets/feedback_type_model.dart';
import 'package:refugee_help/presentation/core/widgets/text/form_error_text.dart';

class TicketFeedbackTypeFormField extends FormField<FeedbackTypeModel> {
  TicketFeedbackTypeFormField({
    Key? key,
    bool editable = true,
    FeedbackTypeModel? initialValue,
    AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction,
    FormFieldSetter<FeedbackTypeModel?>? onSaved,
    FormFieldValidator<FeedbackTypeModel?>? validator,
    void Function(FeedbackTypeModel? value)? onChanged,
  }) : super(
          key: ObjectKey(initialValue),
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          autovalidateMode: autovalidateMode,
          builder: (FormFieldState<FeedbackTypeModel?> state) => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _FeedbackTypeDropdown(
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

class _FeedbackTypeDropdown extends StatelessWidget {
  final bool editable;
  final FeedbackTypeModel? value;
  final void Function(FeedbackTypeModel? type)? onChanged;

  List<FeedbackTypeModel> get _list => FeedbackTypeModel.list;

  const _FeedbackTypeDropdown({
    Key? key,
    this.editable = true,
    this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => DropdownButton<FeedbackTypeModel>(
          hint: Text("feedback_type".tr()),
          value: value,
          items: _items(context, constraints: constraints),
          onChanged: editable ? onChanged : null,
          itemHeight: 80,
        ),
      );

  List<DropdownMenuItem<FeedbackTypeModel>> _items(
    BuildContext context, {
    required BoxConstraints constraints,
  }) =>
      List.generate(
        _list.length,
        (index) => _item(context, constraints: constraints, type: _list[index]),
      );

  DropdownMenuItem<FeedbackTypeModel> _item(
    BuildContext context, {
    required FeedbackTypeModel type,
    required BoxConstraints constraints,
  }) =>
      DropdownMenuItem(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: constraints.maxWidth * 0.9),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(child: Icon(type.icon)),
            title: Text(type.name),
          ),
        ),
        value: type,
      );
}
