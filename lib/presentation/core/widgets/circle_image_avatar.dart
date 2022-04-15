import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/domain/core/image_model.dart';
import 'package:refugee_help/presentation/core/widgets/images/app_image.dart';

class CircleImageAvatar extends StatelessWidget {
  final ImageModel? image;
  final double radius;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const CircleImageAvatar({
    Key? key,
    this.image,
    this.radius = 46,
    this.backgroundColor,
    this.foregroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (image == null || !(image!.isValid)) {
      return _placeholderAvatar(context);
    }

    return AppImage(
      image: image!,
      imageBuilder: (context, provider) => Center(
        child: CircleAvatar(
          foregroundImage: provider,
          radius: radius,
        ),
      ),
      localBuilder: (imageBytes) => CircleAvatar(
        foregroundImage: MemoryImage(image!.imageData!),
        radius: radius,
      ),
      placeholderBuilder: (context, __) => Center(
        child: CircleAvatar(
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          radius: radius,
          child: CircularProgressIndicator.adaptive(
            valueColor: AlwaysStoppedAnimation<Color>(foregroundColor ?? Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _placeholderAvatar(BuildContext context) => CircleAvatar(
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        foregroundColor: foregroundColor ?? Colors.white,
        radius: radius,
        child: Icon(MdiIcons.account, size: radius),
      );
}
