import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:refugee_help/domain/user/user_info_model.dart';
import 'package:refugee_help/infrastructure/utils.dart';
import 'package:refugee_help/presentation/core/widgets/circle_image_avatar.dart';
import 'package:refugee_help/presentation/core/widgets/text/tile_sub2_text.dart';

class UserInfoTile extends StatelessWidget {
  final bool visible;
  final UserInfoModel info;

  const UserInfoTile({Key? key, this.visible = false, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) => Visibility(
        visible: visible,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ListTile(
            leading: SizedBox(
              width: 60,
              height: 60,
              child: CircleImageAvatar(image: info.profileImage),
            ),
            title: Text("owner".tr()),
            contentPadding: EdgeInsets.zero,
            subtitle: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TileSub2Text(text: info.fullName),
                TileSub2Text(text: info.phone!),
              ],
            ),
            onTap: () => Utils.call(info.phone!),
          ),
        ),
      );
}
