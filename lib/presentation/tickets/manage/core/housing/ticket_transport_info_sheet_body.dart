import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/domain/housing/housing_info_model.dart';
import 'package:refugee_help/infrastructure/utils.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/base_elevated_buton.dart';

import 'ticket_housing_info_sheet_body/housing_info_sheet_tile.dart';

class TicketHousingInfoSheetBody extends StatelessWidget {
  final HousingInfoModel info;

  const TicketHousingInfoSheetBody({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HousingInfoSheetTile(
              icon: MdiIcons.mapMarker,
              label: "${"address".tr()}: ${info.address!}",
            ),
            HousingInfoSheetTile(
              icon: (info.bedsAvailable! > 1) ? MdiIcons.bedDouble : MdiIcons.bed,
              label: "${"beds_available".tr()}: ${info.bedsAvailable!}",
            ),
            HousingInfoSheetTile(
              icon: MdiIcons.calendarAccount,
              label: "${"housing_period".tr()}: ${info.periodStr}",
            ),
            HousingInfoSheetTile(
              icon: MdiIcons.information,
              label: "${"remarks".tr()}: ${info.remarks}",
            ),
            HousingInfoSheetTile(
              icon: MdiIcons.cardAccountDetails,
              label: "${"owner".tr()}: ${info.user!.fullName}",
            ),
            BaseElevatedButton.icon(
              icon: const Icon(MdiIcons.phone),
              label: Text("${"phone".tr()}: ${info.user!.phone}"),
              onPressed: () => Utils.call(info.user!.phone!),
            ),
          ],
        ),
      );
}
