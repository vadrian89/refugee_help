import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/tickets/list/list_tickets_cubit.dart';
import 'package:refugee_help/domain/tickets/list_tickets_request_model.dart';

import 'ticket_list_tile.dart';
import 'tickets_list_consumer.dart';

class TicketListMobileBody extends StatefulWidget {
  const TicketListMobileBody({Key? key}) : super(key: key);

  @override
  State<TicketListMobileBody> createState() => _TicketListMobileBodyState();
}

class _TicketListMobileBodyState extends State<TicketListMobileBody> {
  late final ListTicketsCubit _bloc;
  late final ScrollController _controller;
  int _currentPage = 0;
  int _totalRows = 0;

  int get _pageLimit => _currentPage * 20;
  ListTicketsRequestModel get _request => ListTicketsRequestModel(limit: _pageLimit);

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_scrollEventListener);
    _currentPage++;
    _bloc = context.read<ListTicketsCubit>()..fetchList(_request);
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollEventListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TicketsListConsumer(
        builder: (context, response) {
          _totalRows = response.totalRows;

          return ListView.separated(
            controller: _controller,
            itemBuilder: (context, index) => TicketListTile(ticket: response.list[index]),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: response.list.length,
          );
        },
      );

  void _scrollEventListener() {
    if (_controller.position.pixels > 0 &&
        _controller.position.pixels == _controller.position.maxScrollExtent &&
        _pageLimit < _totalRows) {
      _currentPage++;
      _bloc.fetchList(_request);
    }
  }
}
