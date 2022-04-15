import 'package:flutter/material.dart';
import 'package:refugee_help/presentation/core/responsive_widgets/responsive_widget.dart';
import 'package:refugee_help/presentation/housing/list/core/body/housing_list_desktop_body.dart';
import 'package:refugee_help/presentation/housing/list/core/body/housing_list_mobile_body.dart';

class HousingListBodyView extends ResponsiveWidget {
  const HousingListBodyView({Key? key}) : super(key: key);

  @override
  Widget phone(BuildContext context) => const HousingListMobileBody();

  @override
  Widget desktop(BuildContext context) => const HousingListDesktopBody();
}
