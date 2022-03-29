import 'package:flutter/material.dart';

class ScrollableWidget extends StatefulWidget {
  final Widget child;
  final bool horizontalScroll;

  const ScrollableWidget({
    Key? key,
    required this.child,
    this.horizontalScroll = true,
  }) : super(key: key);

  @override
  _ScrollableWidgetState createState() => _ScrollableWidgetState();
}

class _ScrollableWidgetState extends State<ScrollableWidget> {
  ScrollController? _horizontalScrollCtrl;
  late final ScrollController _verticalScrollCtrl;

  @override
  void initState() {
    super.initState();
    if (widget.horizontalScroll) {
      _horizontalScrollCtrl = ScrollController();
    }
    _verticalScrollCtrl = ScrollController();
  }

  @override
  void dispose() {
    _horizontalScrollCtrl?.dispose();
    _verticalScrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => _hScrollBar(
          child: SizedBox(
            width: constraints.maxWidth,
            child: Scrollbar(
              controller: _verticalScrollCtrl,
              child: SingleChildScrollView(
                controller: _verticalScrollCtrl,
                scrollDirection: Axis.vertical,
                child: widget.child,
              ),
            ),
          ),
        ),
      );

  Widget _hScrollBar({required Widget child}) {
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
      return Row(
        children: [Expanded(child: child)],
      );
    }
  }
}
