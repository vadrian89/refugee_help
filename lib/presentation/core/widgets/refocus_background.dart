import 'package:flutter/material.dart';

class RefocusBackground extends StatelessWidget {
  final Widget child;

  const RefocusBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: child,
      );
}
