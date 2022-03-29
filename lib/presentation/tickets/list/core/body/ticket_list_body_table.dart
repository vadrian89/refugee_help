import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/domain/tickets/ticket_model.dart';
import 'package:refugee_help/presentation/core/widgets/scrollable_widget.dart';

class TicketListBodyTable extends StatelessWidget {
  final List<TicketModel> list;

  const TicketListBodyTable({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScrollableWidget(
        child: PaginatedDataTable(
          columns: _tableColumns,
          source: _TicketsDataSource(
            tickets: list,
            onPressed: (ticket) => context.read<RootRouterCubit>().goToTickets(id: ticket.id),
          ),
          showCheckboxColumn: false,
          rowsPerPage: 20,
          showFirstLastButtons: true,
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
}

class _TicketsDataSource extends DataTableSource {
  final List<TicketModel> tickets;
  final void Function(TicketModel ticket) onPressed;

  _TicketsDataSource({required this.tickets, required this.onPressed});

  @override
  DataRow? getRow(int index) => DataRow(
        cells: [
          _cell(
            value: tickets[index].adultsNumber.toString(),
            color: tickets[index].status.color,
          ),
          _cell(
            value: tickets[index].childrenNumber.toString(),
            color: tickets[index].status.color,
          ),
          _cell(
            value: tickets[index].destination,
            color: tickets[index].status.color,
          ),
          _cell(
            value: tickets[index].transport?.registrationNumber,
            color: tickets[index].status.color,
          ),
          _cell(
            value: tickets[index].transport?.user?.fullName,
            color: tickets[index].status.color,
          ),
          _cell(
            value: tickets[index].transport?.user?.phone,
            color: tickets[index].status.color,
          ),
          _cell(
            value: tickets[index].status.name,
            color: tickets[index].status.color,
          ),
          _cell(
            value: tickets[index].dispatcher?.fullName,
            color: tickets[index].status.color,
          ),
        ],
        onSelectChanged: (_) => onPressed(tickets[index]),
      );

  DataCell _cell({
    String? value,
    Color? color,
  }) =>
      DataCell(Text(
        value ?? "n/a",
        style: TextStyle(color: color),
      ));

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => tickets.length;

  @override
  int get selectedRowCount => 0;
}
