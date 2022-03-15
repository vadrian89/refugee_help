import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/application/transport/list/list_transport_cubit.dart';
import 'package:refugee_help/domain/transport/transport_model.dart';
import 'package:refugee_help/presentation/core/adaptive_widgets/dialogs/adaptive_dialog.dart';
import 'package:refugee_help/presentation/transport/list/core/transport_list_tile.dart';

class TransportListSlidable extends StatelessWidget {
  final TransportModel model;

  const TransportListSlidable({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(
        child: TransportListTile(model: model),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) => AdaptiveDialog.showConfirmation(
                context,
                title: "delete_something".tr(args: [model.registrationNumber!]),
                content: "delete_confirmation.something".tr(args: [model.registrationNumber!]),
                confirmText: "yes".tr(),
                cancelText: "no".tr(),
              ).then((value) {
                if (value) {
                  context.read<ListTransportCubit>().delete(model);
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
