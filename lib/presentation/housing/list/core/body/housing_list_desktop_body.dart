import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/application/housing/list/list_housing_cubit.dart';
import 'package:refugee_help/application/root_router/router_housing_state.dart';
import 'package:refugee_help/domain/housing/housing_model.dart';
import 'package:refugee_help/domain/housing/housing_type_model.dart';
import 'package:refugee_help/domain/housing/list_housing_request_model.dart';
import 'package:refugee_help/presentation/core/widgets/no_data_placeholder.dart';
import 'package:refugee_help/presentation/core/widgets/tables/data_list_table.dart';
import 'package:refugee_help/presentation/core/widgets/text_fields/app_text_form_field.dart';
import 'package:refugee_help/presentation/housing/manage/core/housing_type_dropdown.dart';

import 'housing_list_consumer.dart';

class HousingListDesktopBody extends StatefulWidget {
  final bool enableFilters;

  const HousingListDesktopBody({Key? key, this.enableFilters = false}) : super(key: key);

  @override
  State<HousingListDesktopBody> createState() => _HousingListDesktopBodyState();
}

class _HousingListDesktopBodyState extends State<HousingListDesktopBody> {
  late ListHousingCubit _bloc;
  List<HousingModel> _list = const [];
  static const int _pageLimit = 20;
  int _currentPage = 1;
  String _countyFilter = "";
  String _cityFilter = "";
  Timer? _timer;

  ListHousingRequestModel _request = const ListHousingRequestModel();
  int get _startIndex => _pageLimit * (_currentPage - 1);
  int get _endIndex {
    final endIndex = _startIndex + _pageLimit;
    return (endIndex < _filteredList.length) ? endIndex : _filteredList.length;
  }

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

  List<HousingModel> get _pagedList => _filteredList.getRange(_startIndex, _endIndex).toList();

  @override
  void initState() {
    super.initState();
    _bloc = context.read<ListHousingCubit>()..fetchList(_request, all: widget.enableFilters);
  }

  @override
  Widget build(BuildContext context) => HousingListConsumer(
        builder: (context, list) {
          _list = list;

          return DataListTable(
            headerActions: widget.enableFilters ? _tableActions(context) : null,
            emptyPlaceholder: const NoDataPlaceholder(),
            columns: _tableColumns,
            page: _currentPage,
            pageLimit: _pageLimit,
            totalRows: _list.length,
            rows: List.generate(
              _pagedList.length,
              (index) => _row(context, _pagedList[index]),
            ),
            onNext: () => setState(() => ++_currentPage),
            onBack: () => setState(() => --_currentPage),
          );
        },
      );

  List<Widget> _tableActions(BuildContext context) => [
        _textField(
          hintText: "county".tr(),
          onChanged: (val) => setState(() => _countyFilter = val.trim().toLowerCase()),
        ),
        _textField(
          hintText: "city".tr(),
          onChanged: (val) => setState(() => _cityFilter = val.trim().toLowerCase()),
        ),
        _textField(
          hintText: "beds_available".tr(),
          onChanged: (val) {
            _request = _request.copyWith(bedsAvailable: int.tryParse(val));
            _delayedSearch(context);
          },
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 200, maxHeight: 68),
          child: HousingTypeDropdown(
            enableAll: true,
            value: _request.type ?? HousingTypeModel.all(),
            onChanged: (val) => setState(() {
              _request = _request.copyWith(type: (val == HousingTypeModel.all()) ? null : val);
              _bloc.fetchList(_request, all: widget.enableFilters);
            }),
          ),
        ),
      ];

  Widget _textField({String? hintText, ValueChanged<String>? onChanged}) => ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 200),
        child: AppTextFormField(
          hintText: hintText,
          onChanged: onChanged,
        ),
      );

  DataRow _row(BuildContext context, HousingModel housing) => DataRow(
        cells: [
          _cell(value: housing.bedsAvailable.toString()),
          _cell(value: housing.county),
          _cell(value: housing.city),
          _cell(value: housing.type?.name),
          _cell(value: housing.hasTransport! ? "yes".tr() : "no".tr()),
          _cell(value: housing.isAvailable! ? "yes".tr() : "no".tr()),
          _cell(value: housing.user?.fullName),
          _cell(value: housing.user?.phone),
          if (widget.enableFilters)
            DataCell(
              IconButton(
                icon: const Icon(MdiIcons.magnify),
                color: Theme.of(context).primaryColor,
                onPressed: () =>
                    context.read<RootRouterCubit>().goToHousing(RouterHousingState(id: housing.id)),
              ),
            ),
        ],
        onSelectChanged: (_) {
          if (widget.enableFilters) {
            Navigator.maybePop(context, housing);
          } else {
            context.read<RootRouterCubit>().goToHousing(RouterHousingState(id: housing.id));
          }
        },
      );

  List<DataColumn> get _tableColumns => [
        DataColumn(label: Text("beds_available".tr())),
        DataColumn(label: Text("county".tr())),
        DataColumn(label: Text("city".tr())),
        DataColumn(label: Text("housing_type".tr())),
        DataColumn(label: Text("offers_transport".tr())),
        DataColumn(label: Text("available".tr())),
        DataColumn(label: Text("owner".tr())),
        DataColumn(label: Text("phone".tr())),
        if (widget.enableFilters) DataColumn(label: Text("actions".tr())),
      ];

  DataCell _cell({String? value}) => DataCell(Text(value ?? "n/a"));

  void _delayedSearch(BuildContext context) {
    _timer?.cancel();
    _timer = Timer(
      const Duration(milliseconds: 500),
      () => _bloc.fetchList(_request, all: widget.enableFilters),
    );
  }
}
