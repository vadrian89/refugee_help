import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/presentation/core/widgets/app_scaffold.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/profile_required_add_fab.dart';

import 'core/housing_list_body.dart';

class HousingListScreen extends StatelessWidget {
  const HousingListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScaffoldMessenger(
        child: AppScaffold(
          appBar: AppBar(title: Text("housing".tr())),
          body: const HousingListBody(),
          addButton: ProfileRequiredAddFab(
            onPressed: () => context.read<RootRouterCubit>().goToHousing(add: true),
          ),
        ),
      );
}
