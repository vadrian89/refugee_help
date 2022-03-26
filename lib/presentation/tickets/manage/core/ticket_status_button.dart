import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:refugee_help/domain/tickets/ticket_status_model.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/bottom_sheets/adaptive_bottom_sheet.dart';
import 'package:refugee_help/presentation/core/bloc_builders/privileged_builder.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/expanded_elevated_icon_button.dart';

class TicketStatusButton extends StatelessWidget {
  final TicketStatusModel status;
  final void Function(TicketStatusModel? status) onChanged;

  const TicketStatusButton({Key? key, required this.status, required this.onChanged})
      : super(key: key);

  List<TicketStatusModel> get _list => TicketStatusModel.list;

  @override
  Widget build(BuildContext context) => PrivilegedBuilder(
        builder: (context, isPrivileged) => ExpandedElevatedIconButton(
          label: status.name!,
          icon: Icon(status.icon),
          backgroundColor: status.color,
          foregroundColor: Colors.white,
          onPressed: () => isPrivileged
              ? AdaptiveBottomSheet(
                  title: "status".tr(),
                  bodyChildren: _statusChildren(context),
                ).show<TicketStatusModel?>(context).then(onChanged)
              : null,
        ),
      );

  List<Widget> _statusChildren(BuildContext context) => List.generate(
        _list.length,
        (index) => CheckboxListTile(
          value: _list[index].id == status.id,
          title: Text(
            _list[index].name!,
            style: TextStyle(color: _list[index].color),
          ),
          activeColor: _list[index].color,
          onChanged: (_) => Navigator.maybePop(context, _list[index]),
        ),
      );
}
