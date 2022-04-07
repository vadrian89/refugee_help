import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/application/tickets/list/list_tickets_cubit.dart';
import 'package:refugee_help/domain/tickets/ticket_model.dart';
import 'package:refugee_help/domain/tickets/list_tickets_request_model.dart';
import 'package:refugee_help/presentation/core/widgets/tables/data_list_table.dart';

import 'tickets_list_consumer.dart';

class TicketListDesktopBody extends StatefulWidget {
  const TicketListDesktopBody({Key? key}) : super(key: key);

  @override
  State<TicketListDesktopBody> createState() => _TicketListDesktopBodyState();
}

class _TicketListDesktopBodyState extends State<TicketListDesktopBody> {
  List<TicketModel> _list = const [];
  static const int _pageLimit = 20;
  int _currentPage = 1;

  ListTicketsRequestModel get _request => const ListTicketsRequestModel();
  int get _startIndex => _pageLimit * (_currentPage - 1);
  int get _endIndex {
    final endIndex = _startIndex + _pageLimit;
    return (endIndex < _list.length) ? endIndex : _list.length;
  }

  List<TicketModel> get _filteredList => _list.getRange(_startIndex, _endIndex).toList();

  @override
  void initState() {
    super.initState();
    context.read<ListTicketsCubit>().fetchList(_request);
  }

  @override
  Widget build(_) => TicketsListConsumer(
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
