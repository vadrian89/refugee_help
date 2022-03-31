import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/presentation/core/widgets/horizontal_spacing.dart';

import 'data_list_table_control.btn.dart';

class DataListTable extends StatefulWidget {
  final List<DataColumn> columns;
  final List<DataRow> rows;
  final bool enableHorizontalScroll;
  final int page;
  final int? totalRows;
  final VoidCallback? onBack;
  final VoidCallback? onNext;

  const DataListTable({
    Key? key,
    required this.columns,
    required this.rows,
    this.enableHorizontalScroll = true,
    this.page = 1,
    this.totalRows,
    this.onBack,
    this.onNext,
  }) : super(key: key);

  @override
  _DataListTableState createState() => _DataListTableState();
}

class _DataListTableState extends State<DataListTable> {
  late final ScrollController _verticalScrollCtrl;
  ScrollController? _horizontalScrollCtrl;

  int get _startIndex => (widget.page - 1) * widget.rows.length;
  int get _pageLimit => _startIndex + widget.rows.length;
  String get _rowsInfo {
    String rowsInfo = "${_startIndex + 1} - $_pageLimit";
    if (widget.totalRows != null) {
      rowsInfo = "$rowsInfo ${"of".tr().toLowerCase()} ${widget.totalRows ?? ""}";
    }
    return rowsInfo;
  }

  bool get _hasLess => widget.page > 1;

  bool get _hasMore => _pageLimit < (widget.totalRows ?? 0);

  @override
  void initState() {
    super.initState();
    _verticalScrollCtrl = ScrollController();
    if (widget.enableHorizontalScroll) {
      _horizontalScrollCtrl = ScrollController();
    }
  }

  @override
  void dispose() {
    _verticalScrollCtrl.dispose();
    _horizontalScrollCtrl?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(_rowsInfo),
                  const HorizontalSpacing(20),
                  DataListTableControlBtn(
                    icon: MdiIcons.chevronLeft,
                    onPressed: _hasLess ? widget.onBack : null,
                  ),
                  DataListTableControlBtn(
                    icon: MdiIcons.chevronRight,
                    onPressed: _hasMore ? widget.onNext : null,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _horizontalScrollBar(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minWidth: constraints.maxWidth),
                        child: _verticalScrollBar(
                          child: DataTable(
                            columns: List.generate(
                              widget.columns.length,
                              (index) => widget.columns[index],
                            ),
                            rows: widget.rows,
                            showCheckboxColumn: false,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _verticalScrollBar({required Widget child}) => Scrollbar(
        controller: _verticalScrollCtrl,
        child: SingleChildScrollView(
          controller: _verticalScrollCtrl,
          scrollDirection: Axis.vertical,
          child: child,
        ),
      );

  Widget _horizontalScrollBar({required Widget child}) {
    if (_horizontalScrollCtrl != null) {
      return Scrollbar(
        controller: _horizontalScrollCtrl,
        child: SingleChildScrollView(
          controller: _horizontalScrollCtrl,
          scrollDirection: Axis.horizontal,
          child: child,
        ),
      );
    } else {
      return child;
    }
  }
}
