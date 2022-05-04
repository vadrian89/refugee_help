import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/application/root_router/router_housing_state.dart';
import 'package:refugee_help/domain/housing/housing_model.dart';
import 'package:refugee_help/presentation/core/widgets/circle_image_avatar.dart';
import 'package:refugee_help/presentation/core/widgets/text/head6_text.dart';
import 'package:refugee_help/presentation/core/widgets/text/sub2_text.dart';

class HousingListTile extends StatelessWidget {
  final HousingModel model;
  final bool useViewButton;

  const HousingListTile({
    Key? key,
    required this.model,
    this.useViewButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        leading: SizedBox(
          child: CircleImageAvatar(image: model.imageList!.first, radius: 40),
          width: 40,
          height: 40,
        ),
        title: Head6Text(text: model.address!),
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.5),
              child: Sub2Text(
                text: "${"housing_type".tr()}: ${model.type?.name ?? "-"}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.5),
              child: Sub2Text(
                text: "${"beds_available".tr()}: ${model.bedsAvailable}",
              ),
            ),
          ],
        ),
        trailing: useViewButton
            ? IconButton(
                icon: const Icon(MdiIcons.magnify),
                color: Theme.of(context).primaryColor,
                onPressed: () => _view(context),
              )
            : null,
        onTap: () {
          if (useViewButton) {
            Navigator.maybePop(context, model);
          } else {
            _view(context);
          }
        },
      );

  void _view(BuildContext context) =>
      context.read<RootRouterCubit>().goToHousing(RouterHousingState(id: model.id));
}
