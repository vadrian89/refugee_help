import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/application/tickets/list/list_tickets_cubit.dart';
import 'package:refugee_help/domain/tickets/ticket_model.dart';
import 'package:refugee_help/domain/tickets/ticket_request.dart';
import 'package:refugee_help/presentation/core/widgets/tables/data_list_table.dart';

class TicketListBodyTable extends StatelessWidget {
  final List<TicketModel> list;
  final int page;
  final int pageLimit;
  final int? totalRows;

  const TicketListBodyTable({
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
          (index) => _row(context, list[index]),
        ),
        onNext: () => context.read<ListTicketsCubit>().fetchList(
              request: const TicketRequest(),
              isTable: true,
            ),
        onBack: () => context.read<ListTicketsCubit>().fetchList(
              request: const TicketRequest(goBack: true),
              isTable: true,
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

  DataRow _row(BuildContext context, TicketModel ticket) => DataRow(
        cells: [
          _cell(
            value: ticket.adultsNumber.toString(),
            color: ticket.status.color,
          ),
          _cell(
            value: ticket.childrenNumber.toString(),
            color: ticket.status.color,
          ),
          _cell(
            value: ticket.destination,
            color: ticket.status.color,
          ),
          _cell(
            value: ticket.transport?.registrationNumber,
            color: ticket.status.color,
          ),
          _cell(
            value: ticket.transport?.user?.fullName,
            color: ticket.status.color,
          ),
          _cell(
            value: ticket.transport?.user?.phone,
            color: ticket.status.color,
          ),
          _cell(
            value: ticket.status.name,
            color: ticket.status.color,
          ),
          _cell(
            value: ticket.dispatcher?.fullName,
            color: ticket.status.color,
          ),
        ],
        onSelectChanged: (_) => context.read<RootRouterCubit>().goToTickets(
              id: ticket.id,
              type: ticket.type,
            ),
      );

  DataCell _cell({
    String? value,
    Color? color,
  }) =>
      DataCell(Text(
        value ?? "n/a",
        style: TextStyle(color: color),
      ));
}
