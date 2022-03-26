import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/transport/manage/manage_transport_cubit.dart';
import 'package:refugee_help/infrastructure/utils.dart';
import 'package:refugee_help/presentation/core/widgets/circle_image_avatar.dart';
import 'package:refugee_help/presentation/core/widgets/text/tile_sub2_text.dart';

class ManageTransportUserInfo extends StatelessWidget {
  const ManageTransportUserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<ManageTransportCubit, ManageTransportState>(
        builder: (context, state) => state.maybeMap(
          orElse: () => const SizedBox(),
          view: (view) => Visibility(
            visible: view.showUserInfo!,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListTile(
                leading: SizedBox(
                  width: 60,
                  height: 60,
                  child: CircleImageAvatar(image: view.transport.user!.profileImage),
                ),
                title: Text("owner".tr()),
                contentPadding: EdgeInsets.zero,
                subtitle: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TileSub2Text(text: view.transport.user!.fullName),
                    TileSub2Text(text: view.transport.user!.phone!),
                  ],
                ),
                onTap: () => Utils.call(view.transport.user!.phone!),
              ),
            ),
          ),
        ),
        buildWhen: (_, current) => current.maybeMap(orElse: () => false, view: (_) => true),
      );
}
