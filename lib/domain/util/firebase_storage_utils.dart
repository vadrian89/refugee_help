import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:refugee_help/domain/core/image_model.dart';
import 'package:refugee_help/domain/core/operation_result.dart';
import 'package:refugee_help/infrastructure/firebase/chrashlytics_utils.dart';
import 'package:refugee_help/infrastructure/utils.dart';

class FirebaseStorageUtils {
  static FirebaseStorage get _storage => FirebaseStorage.instance;

  FirebaseStorageUtils._();

  static Future<OperationResult<String>> uploadData({
    required String cloudPath,
    required Uint8List fileData,
  }) async {
    final metaData = SettableMetadata(contentType: Utils.getImageMime(cloudPath));
    OperationResult<String> result;
    try {
      final task = await _storage.ref().child(cloudPath.replaceAll("..", ".")).putData(
            fileData,
            metaData,
          );
      result = OperationResult.success(await task.ref.getDownloadURL());
    } on FirebaseException catch (e) {
      result = OperationResult.failure("error_uploading_file".tr());
      ChrashlyticsUtils.recordError(e, e.stackTrace);
    } catch (e, stackTrace) {
      result = OperationResult.failure("error_uploading_file".tr());
      ChrashlyticsUtils.recordError(e, stackTrace);
    }
    return result;
  }

  static Future<OperationResult<ImageModel>> uploadImage(ImageModel image) async {
    final result = await uploadData(cloudPath: image.storagePath!, fileData: image.imageData!);
    return result.when(
      failure: (message) => OperationResult.failure(message),
      success: (url) => OperationResult.success(image.copyWith(imageURL: url, imageData: null)),
    );
  }

  static Future<OperationResult<List<ImageModel>>> uploadImageList(List<ImageModel> list) async {
    List<ImageModel> tmpList = [];
    for (int i = 0; i < list.length; i++) {
      final result = await uploadImage(list[i]);
      ImageModel? uploadedImage;
      final failureMessage = result.when(
        success: (image) {
          uploadedImage = image;
          return null;
        },
        failure: (message) => message,
      );

      if (failureMessage?.isNotEmpty ?? false) {
        return OperationResult.failure(failureMessage!);
      }

      tmpList.add(uploadedImage!);
    }
    return OperationResult.success(tmpList);
  }

  static Future<OperationResult> deleteFile(String cloudPath) async {
    OperationResult result = const OperationResult.success();
    try {
      await _storage.ref(cloudPath.replaceAll("..", ".")).delete();
    } on FirebaseException catch (e) {
      result = OperationResult.failure("error_deleting_file".tr());
      ChrashlyticsUtils.recordError(e, e.stackTrace);
    } catch (e, stackTrace) {
      result = OperationResult.failure("error_deleting_file".tr());
      ChrashlyticsUtils.recordError(e, stackTrace);
    }
    return result;
  }

  static Future<OperationResult> deleteImageList(List<ImageModel> list) async {
    OperationResult result = const OperationResult.success();
    for (final image in list) {
      result = await deleteFile(image.storagePath!);
      final isFailure = result.when(failure: (_) => true, success: (_) => false);
      if (isFailure) {
        return result;
      }
    }
    return result;
  }

  static Future<OperationResult> deleteAll(String cloudPath) async {
    OperationResult result = const OperationResult.success();
    try {
      final listResult = await _storage.ref(cloudPath).listAll();
      for (final fileRef in listResult.items) {
        fileRef.delete();
      }
    } on FirebaseException catch (e) {
      result = OperationResult.failure("error_deleting_file".tr());
      ChrashlyticsUtils.recordError(e, e.stackTrace);
    } catch (e, stackTrace) {
      result = OperationResult.failure("error_deleting_file".tr());
      ChrashlyticsUtils.recordError(e, stackTrace);
    }
    return result;
  }
}
