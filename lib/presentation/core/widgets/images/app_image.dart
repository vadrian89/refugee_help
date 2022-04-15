import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/domain/core/image_model.dart';

class AppImage extends StatelessWidget {
  final ImageModel image;
  final ImageWidgetBuilder? imageBuilder;
  final PlaceholderWidgetBuilder? placeholderBuilder;
  final BoxFit fit;
  final Widget Function(Uint8List imageBytes)? localBuilder;

  const AppImage({
    Key? key,
    required this.image,
    this.imageBuilder,
    this.placeholderBuilder,
    this.localBuilder,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (image.isLocal) {
      return (localBuilder != null)
          ? localBuilder!(image.imageData!)
          : Image.memory(image.imageData!, fit: fit);
    }

    return CachedNetworkImage(
      imageUrl: image.imageURL!,
      fit: fit,
      imageBuilder: imageBuilder,
      placeholder: (context, url) {
        if (placeholderBuilder != null) {
          return placeholderBuilder!(context, url);
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      },
      errorWidget: (context, url, error) => _placeholderError,
    );
  }

  Widget get _placeholderError => const CircleAvatar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        child: Icon(MdiIcons.alertDecagramOutline),
      );
}
