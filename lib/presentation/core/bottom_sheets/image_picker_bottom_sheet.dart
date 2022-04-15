import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:refugee_help/domain/core/image_model.dart';
import 'package:path/path.dart' as p;

import '../adaptive_widgets/bottom_sheets/adaptive_bottom_sheet.dart';

class ImagePickerBottomSheet extends StatelessWidget {
  final ImagePicker _imagePicker;

  ImagePickerBottomSheet({Key? key, ImagePicker? imagePicker})
      : _imagePicker = imagePicker ?? ImagePicker(),
        super(key: key);

  @override
  Widget build(BuildContext context) => const SizedBox();

  Future<ImageModel?> show(BuildContext context) async {
    if (kIsWeb) {
      return _selectImageWeb(context);
    }
    return AdaptiveBottomSheet(
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
    ).show<ImageModel?>(context);
  }

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
      _getImage(context, pickedFile: pickedFile);
    }
  }

  Future<void> _getCameraImage(BuildContext context) async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _getImage(context, pickedFile: pickedFile);
    }
  }

  Future<void> _getImage(BuildContext context, {required XFile pickedFile}) async {
    final image = ImageModel(
      imageData: await pickedFile.readAsBytes(),
      fileExtension: p.extension(pickedFile.path),
    );
    Navigator.pop(context, image);
  }

  Future<ImageModel?> _selectImageWeb(BuildContext context) async {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    final selected = pickedFile?.files.single;
    if (pickedFile != null) {
      final image = ImageModel(
        imageData: selected!.bytes,
        fileExtension: selected.extension,
      );
      return image;
    }
    return null;
  }
}
