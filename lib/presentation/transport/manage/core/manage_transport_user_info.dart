import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/transport/manage/manage_transport_cubit.dart';
import 'package:refugee_help/presentation/core/widgets/user_info_tile.dart';

class ManageTransportUserInfo extends StatelessWidget {
  const ManageTransportUserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<ManageTransportCubit, ManageTransportState>(
        builder: (context, state) => state.maybeMap(
          orElse: () => const SizedBox(),
          view: (view) => UserInfoTile(
            visible: view.showUserInfo!,
            info: view.transport.user!,
          ),
        ),
        buildWhen: (_, current) => current.maybeMap(orElse: () => false, view: (_) => true),
      );
}
