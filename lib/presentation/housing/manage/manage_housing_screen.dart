import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/application/housing/manage/manage_housing_cubit.dart';
import 'package:refugee_help/presentation/core/widgets/alt_app_bar.dart';

import 'core/housing_delete_button.dart';
import 'core/housing_edit_button.dart';
import 'core/manage_housing_form.dart';

class ManageHousingScreen extends StatelessWidget {
  final String? id;

  const ManageHousingScreen({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => ManageHousingCubit(
          authCubit: context.read<AuthenticationCubit>(),
          id: id,
        ),
        child: ScaffoldMessenger(
          child: Scaffold(
            appBar: const AltAppBar(
              actions: [HousingDeleteButton(), HousingEditButton()],
            ).appBar,
            body: const ManageHousingForm(),
          ),
        ),
      );
}
