import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/domain/housing/housing_model.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/elevated_icon_button.dart';
import 'package:refugee_help/presentation/core/widgets/circle_image_avatar.dart';
import 'package:refugee_help/presentation/core/widgets/text/head6_text.dart';
import 'package:refugee_help/presentation/core/widgets/text/sub2_text.dart';

class TicketHousingSheetTile extends StatelessWidget {
  final HousingModel housing;
  final void Function(HousingModel housing) onPressed;

  const TicketHousingSheetTile({
    Key? key,
    required this.housing,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        leading: SizedBox(
          child: CircleImageAvatar(image: housing.imageList!.first, radius: 40),
          width: 40,
          height: 40,
        ),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Head6Text(text: housing.address!),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.5),
              child: Sub2Text(
                text: "${"beds_available".tr()}: ${housing.bedsAvailable}",
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.5),
          child: Sub2Text(text: "${"housing_period".tr()}: ${housing.periodStr}"),
        ),
        trailing: ElevatedIconButton(
          icon: MdiIcons.informationOutline,
          onPressed: () => context.read<RootRouterCubit>().toggleTicketHousing(
                housingId: housing.id,
              ),
        ),
        onTap: () => onPressed(housing),
      );
}
