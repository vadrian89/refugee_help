import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/housing/list/list_housing_cubit.dart';
import 'package:refugee_help/domain/housing/list_housing_request_model.dart';
import 'package:refugee_help/presentation/core/bloc_builders/privileged_builder.dart';

import 'housing_list_slidable.dart';
import 'housing_list_tile.dart';
import 'housing_list_consumer.dart';

class HousingListMobileBody extends StatefulWidget {
  const HousingListMobileBody({Key? key}) : super(key: key);

  @override
  State<HousingListMobileBody> createState() => _HousingListMobileBodyState();
}

class _HousingListMobileBodyState extends State<HousingListMobileBody> {
  late final ListHousingCubit _bloc;
  late final ScrollController _controller;
  int _currentPage = 1;
  int _totalRows = 0;

  int get _pageLimit => _currentPage * 10;
  ListHousingRequestModel get _request => ListHousingRequestModel(limit: _pageLimit);

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_scrollEventListener);
    _bloc = context.read<ListHousingCubit>()..fetchList(_request);
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollEventListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => HousingListConsumer(
        builder: (context, list) {
          _totalRows = list.length;

          return ListView.separated(
            controller: _controller,
            itemBuilder: (context, index) => PrivilegedBuilder(
              builder: (context, isPrivileged) => isPrivileged
                  ? HousingListSlidable(model: list[index])
                  : HousingListTile(model: list[index]),
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
