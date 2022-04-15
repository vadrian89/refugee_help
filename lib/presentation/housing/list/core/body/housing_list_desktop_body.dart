import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/application/housing/list/list_housing_cubit.dart';
import 'package:refugee_help/domain/housing/housing_model.dart';
import 'package:refugee_help/domain/housing/list_housing_request_model.dart';
import 'package:refugee_help/presentation/core/widgets/tables/data_list_table.dart';

import 'housing_list_consumer.dart';

class HousingListDesktopBody extends StatefulWidget {
  const HousingListDesktopBody({Key? key}) : super(key: key);

  @override
  State<HousingListDesktopBody> createState() => _HousingListDesktopBodyState();
}

class _HousingListDesktopBodyState extends State<HousingListDesktopBody> {
  List<HousingModel> _list = const [];
  static const int _pageLimit = 20;
  int _currentPage = 1;

  ListHousingRequestModel get _request => const ListHousingRequestModel();
  int get _startIndex => _pageLimit * (_currentPage - 1);
  int get _endIndex {
    final endIndex = _startIndex + _pageLimit;
    return (endIndex < _list.length) ? endIndex : _list.length;
  }

  List<HousingModel> get _filteredList => _list.getRange(_startIndex, _endIndex).toList();

  @override
  void initState() {
    super.initState();
    context.read<ListHousingCubit>().fetchList(_request);
  }

  @override
  Widget build(BuildContext context) => HousingListConsumer(
        builder: (context, list) {
          _list = list;

          return DataListTable(
            columns: _tableColumns,
            page: _currentPage,
            pageLimit: _pageLimit,
            totalRows: _list.length,
            rows: List.generate(
              _filteredList.length,
              (index) => _row(context, _filteredList[index]),
            ),
            onNext: () => setState(() => ++_currentPage),
            onBack: () => setState(() => --_currentPage),
          );
        },
      );

  DataRow _row(BuildContext context, HousingModel housing) => DataRow(
        cells: [
          _cell(value: housing.bedsAvailable.toString()),
          _cell(value: housing.hasTransport! ? "yes".tr() : "no".tr()),
          _cell(value: housing.isAvailable! ? "yes".tr() : "no".tr()),
          _cell(value: housing.user?.fullName),
          _cell(value: housing.user?.phone),
        ],
        onSelectChanged: (_) => context.read<RootRouterCubit>().goToHousing(id: housing.id),
      );

  List<DataColumn> get _tableColumns => [
        DataColumn(label: Text("beds_available".tr())),
        DataColumn(label: Text("offers_transport".tr())),
        DataColumn(label: Text("available".tr())),
        DataColumn(label: Text("owner".tr())),
        DataColumn(label: Text("phone".tr())),
      ];

  DataCell _cell({String? value}) => DataCell(Text(value ?? "n/a"));
}
