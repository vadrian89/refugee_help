import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/application/root_router/router_transport_state.dart';
import 'package:refugee_help/application/transport/list/list_transport_cubit.dart';
import 'package:refugee_help/domain/transport/transport_model.dart';
import 'package:refugee_help/domain/transport/list_transport_request_model.dart';
import 'package:refugee_help/domain/transport/transport_type_model.dart';
import 'package:refugee_help/presentation/core/widgets/no_data_placeholder.dart';
import 'package:refugee_help/presentation/core/widgets/tables/data_list_table.dart';
import 'package:refugee_help/presentation/core/widgets/text_fields/app_text_form_field.dart';
import 'package:refugee_help/presentation/transport/manage/core/transport_type_dropdown.dart';

import 'transport_list_consumer.dart';

class TransportListDesktopBody extends StatefulWidget {
  final bool enableFilters;

  const TransportListDesktopBody({Key? key, this.enableFilters = false}) : super(key: key);

  @override
  State<TransportListDesktopBody> createState() => _TransportListDesktopBodyState();
}

class _TransportListDesktopBodyState extends State<TransportListDesktopBody> {
  List<TransportModel> _list = const [];
  static const int _pageLimit = 20;
  int _currentPage = 1;
  Timer? _timer;

  ListTransportRequestModel _request = const ListTransportRequestModel();
  int get _startIndex => _pageLimit * (_currentPage - 1);
  int get _endIndex {
    final endIndex = _startIndex + _pageLimit;
    return (endIndex < _list.length) ? endIndex : _list.length;
  }

  List<TransportModel> get _filteredList => _list.getRange(_startIndex, _endIndex).toList();

  @override
  void initState() {
    super.initState();
    context.read<ListTransportCubit>().fetchList(_request, all: widget.enableFilters);
  }

  @override
  Widget build(BuildContext context) => TransportListConsumer(
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
              _filteredList.length,
              (index) => _row(context, _filteredList[index]),
            ),
            onNext: () => setState(() => ++_currentPage),
            onBack: () => setState(() => --_currentPage),
          );
        },
      );

  List<Widget> _tableActions(BuildContext context) => [
        _textField(
          hintText: "seats_available".tr(),
          onChanged: (val) {
            _request = _request.copyWith(seatsAvailable: int.tryParse(val));
            _delayedSearch(context);
          },
        ),
        _textField(
          hintText: "destination".tr(),
          onChanged: (val) {
            _request = _request.copyWith(destinations: val);
            _delayedSearch(context);
          },
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 200, maxHeight: 68),
          child: TransportTypeDropdown(
            enableAll: true,
            value: _request.transportType ?? TransportTypeModel.all(),
            onChanged: (val) => setState(() {
              _request = _request.copyWith(
                transportType: (val == TransportTypeModel.all()) ? null : val,
              );
              _fetch(context);
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

  DataRow _row(BuildContext context, TransportModel transport) => DataRow(
        cells: [
          _cell(value: transport.seatsAvailable.toString()),
          _cell(value: transport.registrationNumber.toString()),
          _cell(value: transport.type?.name),
          _cell(value: transport.atLocation! ? "yes".tr() : "no".tr()),
          _cell(value: transport.isAvailable! ? "yes".tr() : "no".tr()),
          _cell(value: transport.destinations),
          _cell(value: transport.user?.fullName),
          _cell(value: transport.user?.phone),
          if (widget.enableFilters)
            DataCell(
              IconButton(
                icon: const Icon(MdiIcons.magnify),
                color: Theme.of(context).primaryColor,
                onPressed: () => context.read<RootRouterCubit>().goToTransport(
                      RouterTransportState(id: transport.id),
                    ),
              ),
            ),
        ],
        onSelectChanged: (_) {
          if (widget.enableFilters) {
            Navigator.maybePop(context, transport);
          } else {
            context.read<RootRouterCubit>().goToTransport(RouterTransportState(id: transport.id));
          }
        },
      );

  List<DataColumn> get _tableColumns => [
        DataColumn(label: Text("seats_available".tr())),
        DataColumn(label: Text("registration_number".tr())),
        DataColumn(label: Text("transport_type".tr())),
        DataColumn(label: Text("at_location".tr())),
        DataColumn(label: Text("available".tr())),
        DataColumn(label: Text("destinations_list".tr())),
        DataColumn(label: Text("owner".tr())),
        DataColumn(label: Text("phone".tr())),
        if (widget.enableFilters) DataColumn(label: Text("actions".tr())),
      ];

  DataCell _cell({String? value}) => DataCell(Text(value ?? "n/a"));

  void _fetch(BuildContext context) =>
      context.read<ListTransportCubit>().fetchList(_request, all: widget.enableFilters);

  void _delayedSearch(BuildContext context) {
    _timer?.cancel();
    _timer = Timer(const Duration(milliseconds: 500), () => _fetch(context));
  }
}
