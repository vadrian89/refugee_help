import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/infrastructure/utils.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/alt_icon_button.dart';
import 'package:refugee_help/presentation/core/widgets/text/head6_text.dart';

import '../../widgets/refocus_background.dart';
import '../core/adaptive_widget.dart';
import 'adaptive_sheet_action.dart';

class AdaptiveBottomSheet extends AdaptiveWidget {
  final String? title;
  final List<Widget> bodyChildren;
  final List<AdaptiveSheetAction>? actions;
  final bool isScrollControlled;
  final bool useRootNavigator;
  final bool isDismissible;
  final bool enableDrag;
  final RouteSettings? routeSettings;
  final ScrollController? actionScrollController;
  final EdgeInsets materialChildrenPadding;
  final bool showMaterialTitle;

  const AdaptiveBottomSheet({
    Key? key,
    this.title,
    required this.bodyChildren,
    this.actions,
    this.isScrollControlled = false,
    this.useRootNavigator = true,
    this.isDismissible = true,
    this.enableDrag = true,
    this.routeSettings,
    this.actionScrollController,
    this.materialChildrenPadding = EdgeInsets.zero,
    this.showMaterialTitle = true,
  }) : super(key: key);

  @override
  Widget cupertinoBuild(BuildContext context) => CupertinoActionSheet(
        title: (title != null) ? _title(context) : null,
        actionScrollController: actionScrollController,
        actions: [
          ...List.generate(
            bodyChildren.length,
            (index) => Material(
              type: MaterialType.transparency,
              child: bodyChildren[index],
            ),
          ),
          if (actions?.isNotEmpty ?? false) ...actions!,
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text("close".tr()),
          onPressed: () => Navigator.maybePop(context),
        ),
      );

  @override
  Widget materialBuild(BuildContext context) => RefocusBackground(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 5,
            top: 5,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showMaterialTitle)
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 64),
                  title: (title != null) ? _title(context) : null,
                  trailing: AltIconButton(
                    icon: MdiIcons.close,
                    onPressed: () => Navigator.maybePop(context),
                  ),
                ),
              ...List.generate(
                bodyChildren.length,
                (index) => Padding(
                  padding: materialChildrenPadding,
                  child: bodyChildren[index],
                ),
              ),
              if (actions?.isNotEmpty ?? false)
                ButtonBar(
                  children: actions!,
                  alignment: MainAxisAlignment.center,
                ),
            ],
          ),
        ),
      );

  Widget _title(BuildContext context) => Head6Text(
        text: title!,
        textAlign: TextAlign.center,
      );

  Future<T?> show<T extends Object?>(BuildContext context) {
    context.read<RootRouterCubit>().toggleModal(true);
    return Utils.isIos ? _showCupertino(context) : _showMaterial(context);
  }

  Future<T?> _showMaterial<T extends Object?>(BuildContext context) => showModalBottomSheet<T?>(
        context: context,
        builder: (context) => this,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        isScrollControlled: isScrollControlled,
        useRootNavigator: useRootNavigator,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        routeSettings: routeSettings,
        constraints: const BoxConstraints(maxWidth: 600),
      ).then((value) {
        context.read<RootRouterCubit>().toggleModal(false);
        return value;
      });

  Future<T?> _showCupertino<T extends Object?>(BuildContext context) => showCupertinoModalPopup<T?>(
        context: context,
        builder: (context) => this,
        barrierDismissible: isDismissible,
        useRootNavigator: useRootNavigator,
        routeSettings: routeSettings,
      ).then((value) {
        context.read<RootRouterCubit>().toggleModal(false);
        return value;
      });
}
