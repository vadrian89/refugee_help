import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/housing/list/list_housing_cubit.dart';
import 'package:refugee_help/domain/housing/housing_model.dart';
import 'package:refugee_help/presentation/core/widgets/loader_widget.dart';

class HousingListConsumer extends StatelessWidget {
  final VoidCallback? onFinished;
  final Widget Function(BuildContext context, List<HousingModel> list) builder;
  final ListHousingCubit? bloc;

  const HousingListConsumer({
    Key? key,
    required this.builder,
    this.onFinished,
    this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocConsumer<ListHousingCubit, ListHousingState>(
        bloc: bloc,
        listener: (context, state) => state.maybeWhen(
          orElse: () => null,
          view: (_) => onFinished != null ? onFinished!() : null,
        ),
        listenWhen: (_, current) => current.maybeWhen(orElse: () => false, view: (_) => true),
        builder: (context, state) => state.maybeWhen(
          orElse: () => const LoaderWidget(),
          view: (list) => builder(context, list),
        ),
        buildWhen: (_, current) => current.maybeWhen(orElse: () => false, view: (_) => true),
      );
}
