import 'package:flutter/material.dart';

abstract class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({Key? key}) : super(key: key);

  Widget phone(BuildContext context);
  Widget tablet(BuildContext context) => phone(context);
  Widget desktop(BuildContext context) => phone(context);

  @protected
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return phone(context);
    if (width < 840) return tablet(context);
    return desktop(context);
  }
}
