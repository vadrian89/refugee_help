import 'package:flutter/material.dart';

class WidgetUtils {
  const WidgetUtils._();

  static bool isPhone(BuildContext context) => MediaQuery.of(context).size.width < 600;
  static bool isTablet(BuildContext context) =>
      !isPhone(context) && MediaQuery.of(context).size.width < 840;
  static bool isDesktop(BuildContext context) => !isPhone(context) && !isTablet(context);
}
