import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/application/housing/list/list_housing_cubit.dart';
import 'package:refugee_help/domain/housing/housing_model.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/dialogs/adaptive_dialog.dart';

import 'housing_list_tile.dart';

class HousingListSlidable extends StatelessWidget {
  final HousingModel model;

  const HousingListSlidable({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(
        child: HousingListTile(model: model),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) => AdaptiveDialog.showConfirmation(
                context,
                title: "delete_something".tr(args: ["the_housing".tr().toLowerCase()]),
                content: "delete_confirmation.something".tr(
                  args: ["the_housing".tr().toLowerCase()],
                ),
                confirmText: "yes".tr(),
                cancelText: "no".tr(),
              ).then((value) {
                if (value) {
                  context.read<ListHousingCubit>().delete(model);
                }
              }),
              backgroundColor: Colors.red,
              icon: MdiIcons.delete,
              label: "delete".tr(),
            ),
          ],
        ),
      );
}
