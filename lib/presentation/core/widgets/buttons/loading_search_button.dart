import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'circular_progress_elevated_button.dart';

/// A search button which shows a [CircularProgressIndicator] when `isSearching == true`.
class LoadingSearchButton extends StatelessWidget {
  final bool isSearching;
  final VoidCallback? onPressed;

  const LoadingSearchButton({
    Key? key,
    this.isSearching = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CircularProgressElevatedButton(
        label: "search".tr(),
        icon: const Icon(MdiIcons.magnify),
        isLoading: isSearching,
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          (isSearching || (onPressed == null)) ? null : onPressed!();
        },
      );
}
