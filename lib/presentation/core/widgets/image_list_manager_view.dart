import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:refugee_help/domain/core/image_model.dart';
import 'package:refugee_help/presentation/core/utils/navigator_utils.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/base_elevated_buton.dart';
import 'package:refugee_help/presentation/core/widgets/images/app_image.dart';
import 'package:refugee_help/presentation/core/widgets/images/app_image_view_screen.dart';

class ImageListManagerView extends StatelessWidget {
  final bool editable;
  final List<ImageModel> list;
  final void Function(ImageModel image)? onDelete;
  final VoidCallback? onAdd;

  List<ImageModel> get _list => list.reversed.toList();

  const ImageListManagerView({
    Key? key,
    this.list = const [],
    this.onDelete,
    this.onAdd,
    this.editable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 100),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => NavigatorUtils.push(
                context,
                screen: AppImageViewScreen(
                  image: _list[index],
                  editable: editable,
                  onDelete: (context, image) {
                    Navigator.maybePop(context);
                    if (onDelete != null) {
                      onDelete!(image);
                    }
                  },
                ),
              ),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  width: 100,
                  child: AppImage(image: _list[index], fit: BoxFit.cover),
                ),
              ),
            ),
            itemCount: _list.length,
          ),
          trailing: Visibility(
            visible: editable,
            child: BaseElevatedButton.icon(
              icon: const Icon(MdiIcons.cameraPlus),
              label: Text("add_image".tr()),
              onPressed: onAdd,
            ),
          ),
        ),
      );
}
