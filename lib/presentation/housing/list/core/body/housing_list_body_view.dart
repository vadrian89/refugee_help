import 'package:flutter/material.dart';
import 'package:refugee_help/presentation/core/responsive_widgets/responsive_widget.dart';
import 'package:refugee_help/presentation/housing/list/core/body/housing_list_desktop_body.dart';
import 'package:refugee_help/presentation/housing/list/core/body/housing_list_mobile_body.dart';

class HousingListBodyView extends ResponsiveWidget {
  final bool enableFilters;

  const HousingListBodyView({Key? key, this.enableFilters = false}) : super(key: key);

  @override
  Widget phone(BuildContext context) => HousingListMobileBody(enableFilters: enableFilters);

  @override
  Widget desktop(BuildContext context) => HousingListDesktopBody(enableFilters: enableFilters);
}
