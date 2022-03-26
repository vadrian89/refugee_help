import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:refugee_help/domain/transport/transport_info_model.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/bottom_sheets/adaptive_bottom_sheet.dart';
import 'package:refugee_help/presentation/core/widgets/text/head6_text.dart';
import 'package:refugee_help/presentation/core/widgets/text/tile_sub2_text.dart';
import 'package:refugee_help/presentation/tickets/manage/core/transport/ticket_transport_info_sheet_body.dart';

class TicketTransportInfoTile extends StatelessWidget {
  final TransportInfoModel info;
  final VoidCallback onPressed;
  final bool editable;

  const TicketTransportInfoTile({
    Key? key,
    required this.info,
    required this.onPressed,
    this.editable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        leading: CircleAvatar(child: Icon(info.type!.icon)),
        isThreeLine: !editable,
        title: Head6Text(text: info.registrationNumber!),
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TileSub2Text(text: "${"seats_available".tr()}: ${info.seatsAvailable}"),
            TileSub2Text(text: "${"destinations_list".tr()}: ${info.destinations}"),
          ],
        ),
        onTap: editable ? onPressed : () => _showTransportDetailsSheet(context),
      );

  void _showTransportDetailsSheet(BuildContext context) => AdaptiveBottomSheet(
        title: "transport_info".tr(),
        bodyChildren: [TicketTransportInfoSheetBody(info: info)],
        isScrollControlled: true,
      ).show(context);
}
