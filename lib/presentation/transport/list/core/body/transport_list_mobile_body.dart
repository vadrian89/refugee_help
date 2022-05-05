import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/transport/list/list_transport_cubit.dart';
import 'package:refugee_help/domain/transport/list_transport_request_model.dart';
import 'package:refugee_help/domain/transport/transport_type_model.dart';
import 'package:refugee_help/presentation/core/widgets/text_fields/app_text_form_field.dart';
import 'package:refugee_help/presentation/transport/manage/core/transport_type_dropdown.dart';

import 'transport_list_tile.dart';
import 'transport_list_consumer.dart';

class TransportListMobileBody extends StatefulWidget {
  final bool enableFilters;

  const TransportListMobileBody({Key? key, this.enableFilters = false}) : super(key: key);

  @override
  State<TransportListMobileBody> createState() => _TransportListMobileBodyState();
}

class _TransportListMobileBodyState extends State<TransportListMobileBody> {
  late final ListTransportCubit _bloc;
  late final ScrollController _controller;
  int _currentPage = 1;
  int _totalRows = 0;
  Timer? _timer;

  int get _pageLimit => _currentPage * 10;
  ListTransportRequestModel _request = const ListTransportRequestModel();

  @override
  void initState() {
    super.initState();
    _request = ListTransportRequestModel(limit: _pageLimit);
    _controller = ScrollController()..addListener(_scrollEventListener);
    _bloc = context.read<ListTransportCubit>()..fetchList(_request, all: widget.enableFilters);
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

          return _filterList(
            child: ListView.separated(
              controller: _controller,
              itemBuilder: (context, index) => TransportListTile(
                model: list[index],
                useViewButton: widget.enableFilters,
              ),
              separatorBuilder: (_, __) => const Divider(),
              itemCount: list.length,
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
          hintText: "seats_available".tr(),
          onChanged: (val) {
            _request = _request.copyWith(seatsAvailable: int.tryParse(val));
            _delayedSearch(context);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TransportTypeDropdown(
            enableAll: true,
            value: _request.transportType ?? TransportTypeModel.all(),
            onChanged: (val) => setState(() {
              _request = _request.copyWith(
                transportType: (val == TransportTypeModel.all()) ? null : val,
              );
              _bloc.fetchList(_request, all: widget.enableFilters);
            }),
          ),
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
    if (_controller.position.pixels > 0 &&
        _controller.position.pixels == _controller.position.maxScrollExtent &&
        _pageLimit <= _totalRows) {
      _currentPage++;
      _bloc.fetchList(_request, all: widget.enableFilters);
    }
  }

  void _delayedSearch(BuildContext context) {
    _timer?.cancel();
    _timer = Timer(
      const Duration(milliseconds: 500),
      () => _bloc.fetchList(_request, all: widget.enableFilters),
    );
  }
}
