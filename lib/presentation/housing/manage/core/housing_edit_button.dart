import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/housing/manage/manage_housing_cubit.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/edit_icon_button.dart';

/// Edit button for the [ManageHousingScreen]'s app bar.
class HousingEditButton extends StatelessWidget {
  const HousingEditButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<ManageHousingCubit, ManageHousingState>(
        builder: (context, state) => Visibility(
          visible: state.maybeMap(
            orElse: () => false,
            view: (view) => view.canUpdate!,
          ),
          child: EditIconButton(onPressed: context.read<ManageHousingCubit>().toggleEdit),
        ),
        buildWhen: (_, current) => current.maybeMap(
          orElse: () => false,
          view: (_) => true,
          edit: (_) => true,
        ),
      );
}
