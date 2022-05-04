import 'package:flutter/material.dart';
import 'package:refugee_help/presentation/core/responsive_widgets/responsive_widget.dart';
import 'package:refugee_help/presentation/transport/list/core/body/transport_list_desktop_body.dart';
import 'package:refugee_help/presentation/transport/list/core/body/transport_list_mobile_body.dart';

class TransportListBodyView extends ResponsiveWidget {
  final bool enableFilters;

  const TransportListBodyView({Key? key, this.enableFilters = false}) : super(key: key);

  @override
  Widget phone(BuildContext context) => TransportListMobileBody(enableFilters: enableFilters);

  @override
  Widget desktop(BuildContext context) => TransportListDesktopBody(enableFilters: enableFilters);
}
