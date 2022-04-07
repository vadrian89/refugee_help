import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/transport/list/list_transport_cubit.dart';
import 'package:refugee_help/domain/transport/list_transport_request_model.dart';
import 'package:refugee_help/presentation/core/bloc_builders/privileged_builder.dart';

import 'transport_list_slidable.dart';
import 'transport_list_tile.dart';
import 'transport_list_consumer.dart';

class TransportListMobileBody extends StatefulWidget {
  const TransportListMobileBody({Key? key}) : super(key: key);

  @override
  State<TransportListMobileBody> createState() => _TransportListMobileBodyState();
}

class _TransportListMobileBodyState extends State<TransportListMobileBody> {
  late final ListTransportCubit _bloc;
  late final ScrollController _controller;
  int _currentPage = 1;
  int _totalRows = 0;

  int get _pageLimit => _currentPage * 10;
  ListTransportRequestModel get _request => ListTransportRequestModel(limit: _pageLimit);

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_scrollEventListener);
    _bloc = context.read<ListTransportCubit>()..fetchList(_request);
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollEventListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TransportListConsumer(
        builder: (context, list) {
          _totalRows = list.length;

          return ListView.separated(
            controller: _controller,
            itemBuilder: (context, index) => PrivilegedBuilder(
              builder: (context, isPrivileged) => isPrivileged
                  ? TransportListSlidable(model: list[index])
                  : TransportListTile(model: list[index]),
            ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: list.length,
          );
        },
      );

  void _scrollEventListener() {
    if (_controller.position.pixels > 0 &&
        _controller.position.pixels == _controller.position.maxScrollExtent &&
        _pageLimit <= _totalRows) {
      _currentPage++;
      _bloc.fetchList(_request);
    }
  }
}
