import 'package:flutter/material.dart';
import 'package:refugee_help/infrastructure/utils.dart';

abstract class AdaptiveWidget extends StatelessWidget {
  const AdaptiveWidget({Key? key}) : super(key: key);

  Widget cupertinoBuild(BuildContext context);
  Widget materialBuild(BuildContext context);

  @override
  Widget build(BuildContext context) =>
      Utils.isIos ? cupertinoBuild(context) : materialBuild(context);
}
