import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';
import 'package:refugee_help/domain/transport/transport_model.dart';
import 'package:refugee_help/presentation/core/widgets/circle_image_avatar.dart';
import 'package:refugee_help/presentation/core/widgets/text/head6_text.dart';
import 'package:refugee_help/presentation/core/widgets/text/sub2_text.dart';

class TransportListTile extends StatelessWidget {
  final TransportModel model;

  const TransportListTile({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        leading: SizedBox(
          child: CircleImageAvatar(image: model.image, radius: 40),
          width: 40,
          height: 40,
        ),
        title: Head6Text(text: model.registrationNumber!),
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.5),
              child: Sub2Text(
                text: "${"seats_available".tr()}: ${model.seatsAvailable}",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.5),
              child: Sub2Text(text: "${"transport_type".tr()}: ${model.type!.name}"),
            ),
          ],
        ),
        onTap: () => context.read<RootRouterCubit>().goToTransport(id: model.id),
      );
}
