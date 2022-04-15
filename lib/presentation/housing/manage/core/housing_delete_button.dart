import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/housing/manage/manage_housing_cubit.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/delete_icon_button.dart';

class HousingDeleteButton extends StatelessWidget {
  const HousingDeleteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<ManageHousingCubit, ManageHousingState>(
        builder: (context, state) => state.maybeMap(
          orElse: () => const SizedBox.shrink(),
          view: (view) => Visibility(
            visible: view.canUpdate!,
            child: DeleteIconButton(
              deletedName: "the_housing".tr().toLowerCase(),
              onPressed: () => context.read<ManageHousingCubit>().delete(view.housing),
            ),
          ),
        ),
        buildWhen: (_, current) => current.maybeMap(
          orElse: () => false,
          view: (_) => true,
          edit: (_) => true,
        ),
      );
}
