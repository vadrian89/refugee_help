import 'package:flutter/material.dart';

import 'sub2_text.dart';

class TileSub2Text extends StatelessWidget {
  final String text;

  const TileSub2Text({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.5),
        child: Sub2Text(text: text),
      );
}
