import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
