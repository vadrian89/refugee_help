import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:refugee_help/domain/core/image_model.dart';
import 'package:refugee_help/presentation/core/widgets/alt_app_bar.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/delete_icon_button.dart';
import 'package:refugee_help/presentation/core/widgets/images/app_image.dart';

class AppImageViewScreen extends StatelessWidget {
  final ImageModel image;
  final bool editable;
  final void Function(BuildContext context, ImageModel image) onDelete;

  const AppImageViewScreen({
    Key? key,
    required this.image,
    this.editable = false,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AltAppBar(
          actions: [
            if (editable)
              DeleteIconButton(
                deletedName: "the_image".tr().toLowerCase(),
                onPressed: () => onDelete(context, image),
              )
          ],
        ).appBar,
        body: GestureDetector(
          onTap: () => Navigator.maybePop(context),
          child: Center(
            child: AppImage(image: image),
          ),
        ),
      );
}
