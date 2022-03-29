import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/domain/transport/transport_model.dart';

class TransportListBodyTable extends StatelessWidget {
  final List<TransportModel> list;

  const TransportListBodyTable({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              child: PaginatedDataTable(
                columns: _tableColumns,
                source: _TransportsDataSource(
                  list: list,
                  onPressed: (ticket) =>
                      context.read<RootRouterCubit>().goToTransport(id: ticket.id),
                ),
                showCheckboxColumn: false,
                rowsPerPage: 20,
                showFirstLastButtons: true,
              ),
            ),
          ],
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
}

class _TransportsDataSource extends DataTableSource {
  final List<TransportModel> list;
  final void Function(TransportModel value) onPressed;

  _TransportsDataSource({required this.list, required this.onPressed});

  @override
  DataRow? getRow(int index) => DataRow(
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
        onSelectChanged: (_) => onPressed(list[index]),
      );

  DataCell _cell({String? value}) => DataCell(Text(value ?? "n/a"));

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => list.length;

  @override
  int get selectedRowCount => 0;
}
