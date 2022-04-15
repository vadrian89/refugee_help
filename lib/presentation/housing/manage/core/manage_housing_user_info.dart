import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/housing/manage/manage_housing_cubit.dart';
import 'package:refugee_help/presentation/core/widgets/user_info_tile.dart';

class ManageHousingUserInfo extends StatelessWidget {
  const ManageHousingUserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<ManageHousingCubit, ManageHousingState>(
        builder: (context, state) => state.maybeMap(
          orElse: () => const SizedBox.shrink(),
          view: (view) => UserInfoTile(
            visible: view.showUserInfo!,
            info: view.housing.user!,
          ),
        ),
        buildWhen: (_, current) => current.maybeMap(
          orElse: () => false,
          view: (_) => true,
          edit: (_) => true,
        ),
      );
}
