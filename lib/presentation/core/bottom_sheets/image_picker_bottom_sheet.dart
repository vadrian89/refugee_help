import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../adaptive_widgets/bottom_sheets/adaptive_bottom_sheet.dart';

class ImagePickerBottomSheet extends StatelessWidget {
  final ImagePicker _imagePicker;

  ImagePickerBottomSheet({Key? key, ImagePicker? imagePicker})
      : _imagePicker = imagePicker ?? ImagePicker(),
        super(key: key);

  @override
  Widget build(BuildContext context) => const SizedBox();

  Future<XFile?> show(BuildContext context) => AdaptiveBottomSheet(
        showMaterialTitle: false,
        bodyChildren: [
          _selectionTile(
            icon: Icons.photo_library,
            label: "image_library".tr(),
            onTap: () => _getGalleryImage(context),
          ),
          _selectionTile(
            icon: Icons.photo_camera,
            label: 'photo_camera'.tr(),
            onTap: () => _getCameraImage(context),
          )
        ],
      ).show<XFile?>(context);

  Widget _selectionTile({
    required String label,
    required IconData icon,
    required void Function() onTap,
  }) =>
      ListTile(
        leading: Icon(icon),
        title: Text(label),
        onTap: onTap,
      );

  Future<void> _getGalleryImage(BuildContext context) async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Navigator.pop(context, pickedFile);
    }
  }

  Future<void> _getCameraImage(BuildContext context) async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      Navigator.pop(context, pickedFile);
    }
  }
}
