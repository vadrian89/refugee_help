import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/application/transport/list/list_transport_cubit.dart';
import 'package:refugee_help/domain/transport/transport_model.dart';
import 'package:refugee_help/domain/transport/list_transport_request_model.dart';
import 'package:refugee_help/presentation/core/widgets/tables/data_list_table.dart';

import 'transport_list_consumer.dart';

class TransportListDesktopBody extends StatefulWidget {
  const TransportListDesktopBody({Key? key}) : super(key: key);

  @override
  State<TransportListDesktopBody> createState() => _TransportListDesktopBodyState();
}

class _TransportListDesktopBodyState extends State<TransportListDesktopBody> {
  List<TransportModel> _list = const [];
  static const int _pageLimit = 20;
  int _currentPage = 1;

  ListTransportRequestModel get _request => const ListTransportRequestModel();
  int get _startIndex => _pageLimit * (_currentPage - 1);
  int get _endIndex {
    final endIndex = _startIndex + _pageLimit;
    return (endIndex < _list.length) ? endIndex : _list.length;
  }

  List<TransportModel> get _filteredList => _list.getRange(_startIndex, _endIndex).toList();

  @override
  void initState() {
    super.initState();
    context.read<ListTransportCubit>().fetchList(_request);
  }

  @override
  Widget build(BuildContext context) => TransportListConsumer(
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

  DataRow _row(BuildContext context, TransportModel transport) => DataRow(
        cells: [
          _cell(value: transport.seatsAvailable.toString()),
          _cell(value: transport.registrationNumber.toString()),
          _cell(value: transport.type?.name),
          _cell(value: transport.atLocation! ? "yes".tr() : "no".tr()),
          _cell(value: transport.isAvailable! ? "yes".tr() : "no".tr()),
          _cell(value: transport.destinations),
          _cell(value: transport.user?.fullName),
          _cell(value: transport.user?.phone),
        ],
        onSelectChanged: (_) => context.read<RootRouterCubit>().goToTransport(id: transport.id),
      );

  List<DataColumn> get _tableColumns => [
        DataColumn(label: Text("seats_available".tr())),
        DataColumn(label: Text("registration_number".tr())),
        DataColumn(label: Text("transport_type".tr())),
        DataColumn(label: Text("at_location".tr())),
        DataColumn(label: Text("available".tr())),
        DataColumn(label: Text("destinations_list".tr())),
        DataColumn(label: Text("owner".tr())),
        DataColumn(label: Text("phone".tr())),
      ];

  DataCell _cell({String? value}) => DataCell(Text(value ?? "n/a"));
}
