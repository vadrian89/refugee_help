import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/application/user/user_cubit.dart';

class UserEditButton extends StatelessWidget {
  const UserEditButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<UserCubit, UserState>(
        builder: (context, state) => Visibility(
          visible: state.maybeMap(orElse: () => false, view: (_) => true),
          child: IconButton(
            icon: const Icon(MdiIcons.pencil),
            onPressed: context.read<UserCubit>().toggleEdit,
          ),
        ),
        buildWhen: (_, current) => current.maybeMap(
          orElse: () => false,
          view: (_) => true,
          edit: (_) => true,
        ),
      );
}
