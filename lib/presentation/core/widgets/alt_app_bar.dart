import 'package:flutter/material.dart';

import 'buttons/alt_back_button.dart';

class AltAppBar extends StatelessWidget {
  final List<Widget>? actions;

  const AltAppBar({Key? key, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) => const SizedBox();

  AppBar get appBar => AppBar(
        leading: const AltBackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: actions,
      );
}
