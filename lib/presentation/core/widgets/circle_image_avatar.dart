import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/domain/core/image_model.dart';

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
    if (image!.isLocal) {
      return _localImage;
    }
    return _networkImage;
  }

  Widget _placeholderAvatar(BuildContext context) => CircleAvatar(
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        foregroundColor: foregroundColor ?? Colors.white,
        radius: radius,
        child: Icon(MdiIcons.account, size: radius),
      );

  Widget get _localImage => CircleAvatar(
        foregroundImage: MemoryImage(image!.imageData!),
        radius: radius,
      );

  Widget get _networkImage => CachedNetworkImage(
        imageUrl: image!.imageURL!,
        fit: BoxFit.contain,
        imageBuilder: (context, provider) => Center(
          child: CircleAvatar(
            foregroundImage: provider,
            radius: radius,
          ),
        ),
        placeholder: (context, __) => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        errorWidget: (context, url, error) => _placeholderError,
      );

  Widget get _placeholderError => CircleAvatar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        radius: radius,
        child: Icon(MdiIcons.alertDecagramOutline, size: radius),
      );
}
