import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class AdaptiveWidget extends StatelessWidget {
  const AdaptiveWidget({Key? key}) : super(key: key);

  Widget cupertinoBuild(BuildContext context);
  Widget materialBuild(BuildContext context);

  @override
  Widget build(BuildContext context) =>
      (!kIsWeb && Platform.isIOS) ? cupertinoBuild(context) : materialBuild(context);
}
