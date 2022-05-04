import 'package:flutter/material.dart';
import 'package:refugee_help/presentation/core/widgets/alt_app_bar.dart';
import 'package:refugee_help/presentation/housing/list/core/housing_list_body.dart';

class SearchHousingScreen extends StatelessWidget {
  const SearchHousingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScaffoldMessenger(
        child: Scaffold(
          appBar: const AltAppBar().appBar,
          body: const HousingListBody(enableFilters: true),
        ),
      );
}
