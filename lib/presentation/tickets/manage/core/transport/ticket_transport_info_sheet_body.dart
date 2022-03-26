import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/domain/transport/transport_info_model.dart';
import 'package:refugee_help/infrastructure/utils.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/base_elevated_buton.dart';

import 'ticket_transport_info_sheet_body/transport_info_sheet_tile.dart';

class TicketTransportInfoSheetBody extends StatelessWidget {
  final TransportInfoModel info;

  const TicketTransportInfoSheetBody({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TransportInfoSheetTile(
              icon: MdiIcons.car,
              label: "${"registration_number".tr()}: ${info.registrationNumber!}",
            ),
            TransportInfoSheetTile(
              icon: MdiIcons.accountGroup,
              label: "${"seats_available".tr()}: ${info.seatsAvailable!}",
            ),
            TransportInfoSheetTile(
              icon: info.type!.icon,
              label: "${"transport_type".tr()}: ${info.type!.name}",
            ),
            TransportInfoSheetTile(
              icon: MdiIcons.mapMarker,
              label: "${"destinations_list".tr()}: ${info.destinations}",
            ),
            TransportInfoSheetTile(
              icon: MdiIcons.information,
              label: "${"remarks".tr()}: ${info.remarks}",
            ),
            TransportInfoSheetTile(
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
