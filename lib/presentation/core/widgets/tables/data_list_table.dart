import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/presentation/core/widgets/horizontal_spacing.dart';

import 'data_list_table_control.btn.dart';

class DataListTable extends StatefulWidget {
  final List<DataColumn> columns;
  final List<Widget>? headerActions;
  final List<DataRow> rows;
  final Widget? emptyPlaceholder;
  final bool enableHorizontalScroll;
  final int page;
  final int pageLimit;
  final int? totalRows;
  final VoidCallback? onBack;
  final VoidCallback? onNext;

  const DataListTable({
    Key? key,
    required this.columns,
    required this.rows,
    this.headerActions,
    this.enableHorizontalScroll = true,
    this.page = 1,
    this.pageLimit = 1,
    this.totalRows,
    this.onBack,
    this.onNext,
    this.emptyPlaceholder,
  }) : super(key: key);

  @override
  _DataListTableState createState() => _DataListTableState();
}

class _DataListTableState extends State<DataListTable> {
  late final ScrollController _verticalScrollCtrl;
  ScrollController? _horizontalScrollCtrl;

  int get _startIndex => (widget.page - 1) * widget.pageLimit;
  int get _endIndex => _startIndex + widget.rows.length;
  bool get _hasLess => widget.page > 1;
  bool get _hasMore => _endIndex < (widget.totalRows ?? 0);

  String get _rowsInfo {
    String rowsInfo = "${_startIndex + 1} - $_endIndex";
    if (widget.totalRows != null) {
      rowsInfo = "$rowsInfo ${"of".tr().toLowerCase()} ${widget.totalRows ?? ""}";
    }
    return rowsInfo;
  }

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
            _header,
            if (widget.totalRows == 0 && widget.emptyPlaceholder != null)
              Expanded(child: widget.emptyPlaceholder!)
            else
              _body(constraints),
          ],
        ),
      );

  Widget get _header => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            if (widget.headerActions?.isNotEmpty ?? false) ..._actions,
            Expanded(child: _paginationControl),
          ],
        ),
      );

  List<Widget> get _actions => List.generate(
        widget.headerActions!.length,
        (index) => Padding(
          padding: (index > 0) ? const EdgeInsets.only(left: 16) : EdgeInsets.zero,
          child: widget.headerActions![index],
        ),
      );

  Widget get _paginationControl => Row(
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
      );

  Widget _body(BoxConstraints constraints) => Expanded(
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
