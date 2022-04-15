import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/housing/manage/manage_housing_cubit.dart';
import 'package:refugee_help/presentation/core/widgets/form_button_bar.dart';

class HousingButtonBar extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onSave;

  const HousingButtonBar({
    Key? key,
    required this.onSave,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<ManageHousingCubit, ManageHousingState>(
        builder: (context, state) => FormButtonBar(
          visible: state.maybeMap(orElse: () => false, edit: (_) => true),
          onCancel: onCancel,
          onSave: onSave,
        ),
        buildWhen: (_, current) => current.maybeMap(
          orElse: () => false,
          view: (_) => true,
          edit: (_) => true,
        ),
      );
}
