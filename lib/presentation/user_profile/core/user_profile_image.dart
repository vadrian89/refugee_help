import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/domain/core/image_model.dart';
import 'package:refugee_help/presentation/core/widgets/circle_image_avatar.dart';

class UserProfileImage extends StatelessWidget {
  final ImageModel? image;
  final bool editable;
  final VoidCallback? onEdit;

  const UserProfileImage({
    Key? key,
    this.image,
    this.editable = false,
    this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        child: Center(
          child: SizedBox(
            width: 120,
            child: Stack(
              children: [
                CircleImageAvatar(image: image, radius: 50),
                if (editable)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Icon(
                      MdiIcons.imageEdit,
                      size: 40,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
              ],
            ),
          ),
        ),
        onTap: () => (editable && onEdit != null) ? onEdit!() : null,
      );
}
