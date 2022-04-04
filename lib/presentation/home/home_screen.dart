import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:refugee_help/presentation/tickets/list/ticket_category_selector.dart';

import '../core/widgets/app_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(_) => ScaffoldMessenger(
        child: AppScaffold(
          appBar: AppBar(title: Text("home".tr())),
          body: const TicketCategorySelector(),
        ),
      );
}
