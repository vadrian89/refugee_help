import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/application/housing/list/list_housing_cubit.dart';
import 'package:refugee_help/presentation/housing/list/core/body/housing_list_body_view.dart';

import 'housing_list_listener.dart';

class HousingListBody extends StatelessWidget {
  final bool enableFilters;

  const HousingListBody({Key? key, this.enableFilters = false}) : super(key: key);

  @override
  Widget build(_) => BlocProvider(
        create: (context) => ListHousingCubit(authCubit: context.read<AuthenticationCubit>()),
        child: HousingListListener(
          child: HousingListBodyView(enableFilters: enableFilters),
        ),
      );
}
