import 'package:flutter/material.dart';
import 'package:refugee_help/presentation/core/utils/widgets_utils.dart';

abstract class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({Key? key}) : super(key: key);

  Widget phone(BuildContext context);
  Widget tablet(BuildContext context) => phone(context);
  Widget desktop(BuildContext context) => phone(context);

  @protected
  @override
  Widget build(BuildContext context) {
    if (WidgetUtils.isPhone(context)) return phone(context);
    if (WidgetUtils.isTablet(context)) return tablet(context);
    return desktop(context);
  }
}
