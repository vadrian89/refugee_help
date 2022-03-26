import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/domain/transport/transport_model.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/elevated_icon_button.dart';
import 'package:refugee_help/presentation/core/widgets/circle_image_avatar.dart';
import 'package:refugee_help/presentation/core/widgets/text/head6_text.dart';
import 'package:refugee_help/presentation/core/widgets/text/sub2_text.dart';

class TicketTransportSheetTile extends StatelessWidget {
  final TransportModel transport;
  final void Function(TransportModel transport) onPressed;

  const TicketTransportSheetTile({
    Key? key,
    required this.transport,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        leading: SizedBox(
          child: CircleImageAvatar(image: transport.image, radius: 40),
          width: 40,
          height: 40,
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Head6Text(text: transport.registrationNumber!),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.5),
              child: Sub2Text(
                text: "${"seats_available".tr()}: ${transport.seatsAvailable}",
              ),
            ),
          ],
        ),
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.5),
              child: Sub2Text(text: "${"transport_type".tr()}: ${transport.type!.name}"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.5),
              child: Sub2Text(
                text: "${"destinations_list".tr()}: ${transport.destinations}",
              ),
            ),
          ],
        ),
        trailing: ElevatedIconButton(
          icon: MdiIcons.informationOutline,
          onPressed: () => context.read<RootRouterCubit>().toggleTicketTransport(
                transportId: transport.id,
              ),
        ),
        onTap: () => onPressed(transport),
      );
}
