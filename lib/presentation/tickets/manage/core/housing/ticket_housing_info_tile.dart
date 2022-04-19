import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/domain/housing/housing_info_model.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/bottom_sheets/adaptive_bottom_sheet.dart';
import 'package:refugee_help/presentation/core/widgets/text/head6_text.dart';
import 'package:refugee_help/presentation/core/widgets/text/tile_sub2_text.dart';

import 'ticket_transport_info_sheet_body.dart';

class TicketHousingInfoTile extends StatelessWidget {
  final HousingInfoModel info;
  final VoidCallback onPressed;
  final bool editable;

  const TicketHousingInfoTile({
    Key? key,
    required this.info,
    required this.onPressed,
    this.editable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        leading: const CircleAvatar(child: Icon(MdiIcons.home)),
        isThreeLine: !editable,
        title: Head6Text(text: info.address!),
        subtitle: TileSub2Text(text: "${"beds_available".tr()}: ${info.bedsAvailable}"),
        onTap: editable ? onPressed : () => _showHousingDetailsSheet(context),
      );

  void _showHousingDetailsSheet(BuildContext context) => AdaptiveBottomSheet(
        title: "housing_info".tr(),
        bodyChildren: [TicketHousingInfoSheetBody(info: info)],
        isScrollControlled: true,
      ).show(context);
}
