import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/user/user_cubit.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/edit_icon_button.dart';

class UserEditButton extends StatelessWidget {
  const UserEditButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<UserCubit, UserState>(
        builder: (context, state) => Visibility(
          visible: state.maybeMap(orElse: () => false, view: (_) => true),
          child: EditIconButton(onPressed: context.read<UserCubit>().toggleEdit),
        ),
        buildWhen: (_, current) => current.maybeMap(
          orElse: () => false,
          view: (_) => true,
          edit: (_) => true,
        ),
      );
}
