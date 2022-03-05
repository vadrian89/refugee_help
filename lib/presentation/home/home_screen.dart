import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/base_icon_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [
            BaseIconButton(
              icon: const Icon(MdiIcons.logout),
              onPressed: context.read<AuthenticationCubit>().signOut,
            )
          ],
        ),
      );
}
