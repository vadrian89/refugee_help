import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:refugee_help/infrastructure/utils.dart';

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

  const AdaptiveBottomSheet({
    Key? key,
    this.title,
    required this.bodyChildren,
    this.actions,
    this.isScrollControlled = false,
    this.useRootNavigator = false,
    this.isDismissible = true,
    this.enableDrag = true,
    this.routeSettings,
    this.actionScrollController,
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
              if (title != null)
                ListTile(
                  leading: BackButton(color: Theme.of(context).textTheme.headline6?.color),
                  contentPadding: EdgeInsets.zero,
                  title: _title(context),
                ),
              ...bodyChildren,
              if (actions?.isNotEmpty ?? false)
                ButtonBar(
                  children: actions!,
                  alignment: MainAxisAlignment.center,
                ),
            ],
          ),
        ),
      );

  Widget _title(BuildContext context) => Text(
        title!,
        textAlign: Utils.isIos ? TextAlign.center : TextAlign.left,
        style: Theme.of(context).textTheme.headline6,
      );

  Future<T?> show<T extends Object?>(BuildContext context) =>
      Utils.isIos ? _showCupertino(context) : _showMaterial(context);

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
      );

  Future<T?> _showCupertino<T extends Object?>(BuildContext context) => showCupertinoModalPopup<T?>(
        context: context,
        builder: (context) => this,
        barrierDismissible: isDismissible,
        useRootNavigator: useRootNavigator,
        routeSettings: routeSettings,
      );
}
