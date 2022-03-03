import 'package:flutter/material.dart';

import '../../widgets/buttons/base_elevated_buton.dart';
import 'adaptive_sheet_action.dart';

class AdaptiveSheetLongAction extends AdaptiveSheetAction {
  final Color? backgroundColor;

  const AdaptiveSheetLongAction({
    Key? key,
    required Widget child,
    required VoidCallback onPressed,
    this.backgroundColor,
  }) : super(key: key, child: child, onPressed: onPressed);

  @override
  Widget materialBuild(BuildContext context) => BaseElevatedButton(
        child: child,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 10)),
          backgroundColor: MaterialStateProperty.all(
            backgroundColor ?? Theme.of(context).primaryColor,
          ),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          textStyle: MaterialStateProperty.all(Theme.of(context).textTheme.headline6),
          fixedSize: MaterialStateProperty.all(
            Size.fromWidth(MediaQuery.of(context).size.width * 0.9),
          ),
        ),
        onPressed: onPressed,
      );
}
