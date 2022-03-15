import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/domain/core/image_model.dart';
import 'package:refugee_help/presentation/core/widgets/circle_image_avatar.dart';

class EditableProfileImage extends StatelessWidget {
  final ImageModel? image;
  final bool editable;
  final VoidCallback? onEdit;
  final double radius;
  final double boxWidth;
  final double iconSize;

  const EditableProfileImage({
    Key? key,
    this.image,
    this.editable = false,
    this.onEdit,
    this.boxWidth = 120,
    this.radius = 50,
    this.iconSize = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        child: Center(
          child: SizedBox(
            width: boxWidth,
            child: Stack(
              children: [
                CircleImageAvatar(image: image, radius: radius),
                if (editable)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Icon(
                      MdiIcons.imageEdit,
                      size: iconSize,
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
