import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/transport/manage/manage_transport_cubit.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/delete_icon_button.dart';

class TransportDeleteButton extends StatelessWidget {
  const TransportDeleteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<ManageTransportCubit, ManageTransportState>(
        builder: (context, state) => state.maybeWhen(
          orElse: () => const SizedBox(),
          view: (model) => DeleteIconButton(
            deletedName: model.registrationNumber!,
            onPressed: () => context.read<ManageTransportCubit>().delete(model),
          ),
        ),
        buildWhen: (_, current) => current.maybeMap(
          orElse: () => false,
          view: (_) => true,
          edit: (_) => true,
        ),
      );
}
