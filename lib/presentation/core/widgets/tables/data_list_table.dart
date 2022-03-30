import 'package:flutter/material.dart';

class DataListTable extends StatefulWidget {
  final List<DataColumn> columns;
  final List<DataRow> rows;
  final bool enableHorizontalScroll;

  const DataListTable({
    Key? key,
    required this.columns,
    required this.rows,
    this.enableHorizontalScroll = true,
  }) : super(key: key);

  @override
  _DataListTableState createState() => _DataListTableState();
}

class _DataListTableState extends State<DataListTable> {
  late final ScrollController _verticalScrollCtrl;
  ScrollController? _horizontalScrollCtrl;
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
        builder: (context, constraints) => Row(
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
