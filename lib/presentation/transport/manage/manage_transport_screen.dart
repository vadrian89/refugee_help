import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/authentication/authentication_cubit.dart';
import 'package:refugee_help/application/transport/manage/manage_transport_cubit.dart';
import 'package:refugee_help/presentation/core/widgets/alt_app_bar.dart';
import 'package:refugee_help/presentation/transport/manage/core/manage_transport_form.dart';
import 'package:refugee_help/presentation/transport/manage/core/transport_edit_button.dart';

import 'core/transport_delete_button.dart';

class ManageTransportScreen extends StatelessWidget {
  final String? id;

  const ManageTransportScreen({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => ManageTransportCubit(
          authCubit: context.read<AuthenticationCubit>(),
          id: id,
        ),
        child: ScaffoldMessenger(
          child: Scaffold(
            appBar: const AltAppBar(
              actions: [
                TransportDeleteButton(),
                TransportEditButton(),
              ],
            ).appBar,
            body: const ManageTransportForm(),
          ),
        ),
      );
}
