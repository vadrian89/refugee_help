import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/housing/list/list_housing_cubit.dart';
import 'package:refugee_help/domain/housing/housing_model.dart';
import 'package:refugee_help/domain/housing/list_housing_request_model.dart';
import 'package:refugee_help/presentation/core/widgets/text_fields/app_text_form_field.dart';

import 'housing_list_tile.dart';
import 'housing_list_consumer.dart';

class HousingListMobileBody extends StatefulWidget {
  final bool enableFilters;

  const HousingListMobileBody({Key? key, this.enableFilters = false}) : super(key: key);

  @override
  State<HousingListMobileBody> createState() => _HousingListMobileBodyState();
}

class _HousingListMobileBodyState extends State<HousingListMobileBody> {
  late final ListHousingCubit _bloc;
  late final ScrollController _controller;
  ListHousingRequestModel _request = const ListHousingRequestModel();
  List<HousingModel> _list = const [];
  int _currentPage = 1;
  String _countyFilter = "";
  String _cityFilter = "";
  Timer? _timer;

  int get _pageLimit => _currentPage * 10;
  int get _totalRows => _filteredList.length;

  List<HousingModel> get _filteredList {
    List<HousingModel> list = List.from(_list);
    if (_countyFilter.isNotEmpty) {
      list =
          list.where((element) => element.countyIndex?.contains(_countyFilter) ?? false).toList();
    }
    if (_cityFilter.isNotEmpty) {
      list = list.where((element) => element.cityIndex?.contains(_cityFilter) ?? false).toList();
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    _request = _request.copyWith(limit: _pageLimit);
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
          _list = list;

          return _filterList(
            child: ListView.separated(
              controller: _controller,
              itemBuilder: (context, index) => HousingListTile(
                model: _filteredList[index],
                useViewButton: widget.enableFilters,
              ),
              separatorBuilder: (_, __) => const Divider(),
              itemCount: _filteredList.length,
            ),
          );
        },
      );

  Widget _filterList({required Widget child}) {
    if (!widget.enableFilters) {
      return child;
    }
    return Column(
      children: [
        _textField(
          hintText: "county".tr(),
          onChanged: (val) => setState(() {
            _countyFilter = val.trim().toLowerCase();
            _delayedSearch(context);
          }),
        ),
        _textField(
          hintText: "city".tr(),
          onChanged: (val) => setState(() {
            _cityFilter = val.trim().toLowerCase();
            _delayedSearch(context);
          }),
        ),
        _textField(
          hintText: "beds_available".tr(),
          onChanged: (val) {
            _request = _request.copyWith(bedsAvailable: int.tryParse(val));
            _delayedSearch(context);
          },
        ),
        Expanded(child: child),
      ],
    );
  }

  Widget _textField({String? hintText, ValueChanged<String>? onChanged}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: AppTextFormField(
          hintText: hintText,
          onChanged: onChanged,
        ),
      );

  void _scrollEventListener() {
    if (_cityFilter.isNotEmpty || _countyFilter.isNotEmpty) {
      return;
    }
    if (_controller.position.pixels > 0 &&
        _controller.position.pixels == _controller.position.maxScrollExtent &&
        _pageLimit <= _totalRows) {
      _currentPage++;
      _bloc.fetchList(_request);
    }
  }

  void _delayedSearch(BuildContext context) {
    _timer?.cancel();
    _timer = Timer(const Duration(milliseconds: 500), _fetch);
  }

  void _fetch() {
    if (_cityFilter.isNotEmpty || _countyFilter.isNotEmpty) {
      _request = _request.copyWith(limit: 100);
    } else {
      _request = _request.copyWith(limit: _pageLimit);
    }
    _bloc.fetchList(_request);
  }
}
