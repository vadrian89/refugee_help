import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/user/user_cubit.dart';
import 'package:refugee_help/presentation/authentication/core/buttons/cancel_button.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/save_button.dart';

class UserButtonBar extends StatelessWidget {
  final VoidCallback onSave;

  const UserButtonBar({
    Key? key,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<UserCubit, UserState>(
        builder: (context, state) => Visibility(
          visible: state.maybeMap(orElse: () => false, edit: (_) => true),
          child: ButtonBar(
            children: [
              CancelButton(onCancel: context.read<UserCubit>().toggleEdit),
              SaveButton(onSave: onSave),
            ],
          ),
        ),
        buildWhen: (_, current) => current.maybeMap(
          orElse: () => false,
          view: (_) => true,
          edit: (_) => true,
        ),
      );
}
