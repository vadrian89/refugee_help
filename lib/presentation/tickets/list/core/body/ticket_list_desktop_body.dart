import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/application/tickets/list/list_tickets_cubit.dart';
import 'package:refugee_help/domain/core/firestore_pagination_info.dart';
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
  static const int _pageLimit = 20;
  late final ListTicketsCubit _bloc;
  int _currentPage = 0;
  bool _inProgress = true;

  FirestorePaginationInfo? _paginationInfo;

  ListTicketsRequestModel get _request => ListTicketsRequestModel(
        limit: _pageLimit,
        paginationInfo: (_currentPage == 0) ? null : _paginationInfo,
      );

  @override
  void initState() {
    super.initState();
    _currentPage++;
    _bloc = context.read<ListTicketsCubit>()..fetchList(_request);
  }

  @override
  Widget build(_) => TicketsListConsumer(
        onFinished: () {
          setState(() => _inProgress = false);
        },
        builder: (context, response) {
          _paginationInfo = response.paginationInfo;

          return DataListTable(
            columns: _tableColumns,
            page: _currentPage,
            pageLimit: _pageLimit,
            totalRows: response.totalRows,
            rows: List.generate(
              response.list.length,
              (index) => _row(context, response.list[index]),
            ),
            onNext: _inProgress ? null : () => _next(context),
            onBack: _inProgress ? null : () => _previous(context),
          );
        },
      );

  void _next(BuildContext context) {
    if (_inProgress) {
      return;
    }
    setState(() => _inProgress = true);
    _currentPage++;

    _bloc.fetchList(_request);
  }

  void _previous(BuildContext context) {
    if (_inProgress) {
      return;
    }
    setState(() => _inProgress = true);
    _currentPage--;

    _bloc.fetchList(_request.copyWith(goBack: true));
  }

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
