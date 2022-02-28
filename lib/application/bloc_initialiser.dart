import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/presentation/app_root.dart';

/// Used to initialise bloc-related stuff, such as: blocs, cubits and repositories.
class BlocInitialiser extends StatelessWidget {
  final AppRoot appRoot;

  const BlocInitialiser({Key? key, required this.appRoot}) : super(key: key);

  @override
  Widget build(_) => Builder(builder: (_) => appRoot);
}
