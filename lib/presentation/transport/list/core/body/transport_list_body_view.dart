import 'package:flutter/material.dart';
import 'package:refugee_help/presentation/core/responsive_widgets/responsive_widget.dart';
import 'package:refugee_help/presentation/transport/list/core/body/transport_list_desktop_body.dart';
import 'package:refugee_help/presentation/transport/list/core/body/transport_list_mobile_body.dart';

class TransportListBodyView extends ResponsiveWidget {
  const TransportListBodyView({Key? key}) : super(key: key);

  @override
  Widget phone(BuildContext context) => const TransportListMobileBody();

  @override
  Widget desktop(BuildContext context) => const TransportListDesktopBody();
}
