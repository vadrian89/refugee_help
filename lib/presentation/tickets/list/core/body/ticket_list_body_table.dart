import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/domain/tickets/ticket_model.dart';
import 'package:refugee_help/presentation/core/widgets/tables/data_list_table.dart';

class TicketListBodyTable extends StatelessWidget {
  final List<TicketModel> list;

  const TicketListBodyTable({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) => DataListTable(
        columns: _tableColumns,
        rows: List.generate(
          list.length,
          (index) => DataRow(
            cells: [
              _cell(
                value: list[index].adultsNumber.toString(),
                color: list[index].status.color,
              ),
              _cell(
                value: list[index].childrenNumber.toString(),
                color: list[index].status.color,
              ),
              _cell(
                value: list[index].destination,
                color: list[index].status.color,
              ),
              _cell(
                value: list[index].transport?.registrationNumber,
                color: list[index].status.color,
              ),
              _cell(
                value: list[index].transport?.user?.fullName,
                color: list[index].status.color,
              ),
              _cell(
                value: list[index].transport?.user?.phone,
                color: list[index].status.color,
              ),
              _cell(
                value: list[index].status.name,
                color: list[index].status.color,
              ),
              _cell(
                value: list[index].dispatcher?.fullName,
                color: list[index].status.color,
              ),
            ],
            onSelectChanged: (_) => context.read<RootRouterCubit>().goToTransport(
                  id: list[index].id,
                ),
          ),
        ),
      );

  List<DataColumn> get _tableColumns => [
        DataColumn(label: Text("adults_number".tr())),
        DataColumn(label: Text("children_number".tr())),
        DataColumn(label: Text("destination".tr())),
        const DataColumn(label: Text("Transport")),
        DataColumn(label: Text("owner".tr())),
        DataColumn(label: Text("phone".tr())),
        DataColumn(label: Text("status".tr())),
        DataColumn(label: Text("dispatcher".tr())),
      ];

  DataCell _cell({
    String? value,
    Color? color,
  }) =>
      DataCell(Text(
        value ?? "n/a",
        style: TextStyle(color: color),
      ));
}
