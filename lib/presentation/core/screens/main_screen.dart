import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:refugee_help/presentation/core/widgets/loader_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("refugee_help".tr())),
        body: const LoaderWidget(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
      );
}
