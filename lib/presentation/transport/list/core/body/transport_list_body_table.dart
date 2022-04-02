import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/application/transport/list/list_transport_cubit.dart';
import 'package:refugee_help/domain/transport/transport_model.dart';
import 'package:refugee_help/domain/transport/transport_request.dart';
import 'package:refugee_help/presentation/core/widgets/tables/data_list_table.dart';

class TransportListBodyTable extends StatelessWidget {
  final List<TransportModel> list;
  final int page;
  final int pageLimit;
  final int? totalRows;

  const TransportListBodyTable({
    Key? key,
    required this.list,
    this.page = 1,
    this.pageLimit = 1,
    this.totalRows,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => DataListTable(
        columns: _tableColumns,
        page: page,
        pageLimit: pageLimit,
        totalRows: totalRows,
        rows: List.generate(
          list.length,
          (index) => DataRow(
            cells: [
              _cell(value: list[index].seatsAvailable.toString()),
              _cell(value: list[index].registrationNumber.toString()),
              _cell(value: list[index].type?.name),
              _cell(value: list[index].atLocation! ? "yes".tr() : "no".tr()),
              _cell(value: list[index].isAvailable! ? "yes".tr() : "no".tr()),
              _cell(value: list[index].destinations),
              _cell(value: list[index].user?.fullName),
              _cell(value: list[index].user?.phone),
            ],
            onSelectChanged: (_) => context.read<RootRouterCubit>().goToTransport(
                  id: list[index].id,
                ),
          ),
        ),
        onNext: () => context.read<ListTransportCubit>().fetchList(
              request: const TransportRequest(),
              isTable: true,
            ),
        onBack: () => context.read<ListTransportCubit>().fetchList(
              request: const TransportRequest(goBack: true),
              isTable: true,
            ),
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
