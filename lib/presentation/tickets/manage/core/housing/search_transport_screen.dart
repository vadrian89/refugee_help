import 'package:flutter/material.dart';
import 'package:refugee_help/presentation/core/widgets/alt_app_bar.dart';
import 'package:refugee_help/presentation/transport/list/core/transport_list_body.dart';

class SearchTransportScreen extends StatelessWidget {
  const SearchTransportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScaffoldMessenger(
        child: Scaffold(
          appBar: const AltAppBar().appBar,
          body: const TransportListBody(enableFilters: true),
        ),
      );
}
