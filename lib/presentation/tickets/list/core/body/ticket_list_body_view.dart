import 'package:flutter/material.dart';
import 'package:refugee_help/presentation/core/responsive_widgets/responsive_widget.dart';
import 'package:refugee_help/presentation/tickets/list/core/body/ticket_list_mobile_body.dart';

import 'ticket_list_desktop_body.dart';

class TicketListBodyView extends ResponsiveWidget {
  const TicketListBodyView({Key? key}) : super(key: key);

  @override
  Widget phone(BuildContext context) => const TicketListMobileBody();

  @override
  Widget desktop(BuildContext context) => const TicketListDesktopBody();
}
