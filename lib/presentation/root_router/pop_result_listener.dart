import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';

class PopResultListener extends StatelessWidget {
  final Widget child;
  final ValueChanged<dynamic> onResultChanged;

  const PopResultListener({Key? key, required this.child, required this.onResultChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) => BlocListener<RootRouterCubit, RootRouterState>(
        listener: (context, state) {
          onResultChanged(state.popResult);
          context.read<RootRouterCubit>().clearResult();
        },
        listenWhen: (_, current) => current.popResult != null,
        child: child,
      );
}
