import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:refugee_help/domain/core/operation_result.dart';
import 'package:refugee_help/infrastructure/firebase/chrashlytics_manager.dart';
import 'package:refugee_help/infrastructure/utils.dart';

class FirebaseStorageManager {
  static FirebaseStorage get _storage => FirebaseStorage.instance;

  FirebaseStorageManager._();

  static Future<OperationResult> uploadFileBytes({
    required String cloudPath,
    required Uint8List fileData,
  }) async {
    final metaData = SettableMetadata(contentType: Utils.getImageMime(cloudPath));
    OperationResult<String> result;
    try {
      final ref = _storage.ref().child(cloudPath.replaceAll("..", "."));
      final refPath = (await ref.putData(fileData, metaData)).ref.fullPath;
      result = OperationResult.success(refPath);
    } on FirebaseException catch (e) {
      result = OperationResult.failure("error_uploading_file".tr());
      ChrashlyticsManager.recordError(e, e.stackTrace);
    } catch (e, stackTrace) {
      result = OperationResult.failure("error_uploading_file".tr());
      ChrashlyticsManager.recordError(e, stackTrace);
    }
    return result;
  }

  static Future<OperationResult> deleteFile(String cloudPath) async {
    OperationResult result = const OperationResult.success();
    try {
      await _storage.ref(cloudPath).delete();
    } on FirebaseException catch (e) {
      result = OperationResult.failure("error_deleting_file".tr());
      ChrashlyticsManager.recordError(e, e.stackTrace);
    } catch (e, stackTrace) {
      result = OperationResult.failure("error_deleting_file".tr());
      ChrashlyticsManager.recordError(e, stackTrace);
    }
    return result;
  }
}
