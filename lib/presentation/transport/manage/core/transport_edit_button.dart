import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/transport/manage/manage_transport_cubit.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/edit_icon_button.dart';

class TransportEditButton extends StatelessWidget {
  const TransportEditButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<ManageTransportCubit, ManageTransportState>(
        builder: (context, state) => Visibility(
          visible: state.maybeMap(
            orElse: () => false,
            view: (view) => view.canUpdate!,
          ),
          child: EditIconButton(onPressed: context.read<ManageTransportCubit>().toggleEdit),
        ),
        buildWhen: (_, current) => current.maybeMap(
          orElse: () => false,
          view: (_) => true,
          edit: (_) => true,
        ),
      );
}
