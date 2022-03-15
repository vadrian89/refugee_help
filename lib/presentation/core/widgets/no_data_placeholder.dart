import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NoDataPlaceholder extends StatelessWidget {
  final String? text;

  const NoDataPlaceholder({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.search,
              size: 70,
              color: Colors.red[300],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: FittedBox(
                child: Text(
                  text ?? "no_data".tr(),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.red[300],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      );
}
