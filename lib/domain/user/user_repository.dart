import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:refugee_help/domain/core/base_repository.dart';
import 'package:refugee_help/domain/core/image_model.dart';
import 'package:refugee_help/domain/core/operation_result.dart';
import 'package:refugee_help/domain/user/user_model.dart';
import 'package:refugee_help/domain/util/firebase_storage_manager.dart';

/// Repository class used for the authentication process
class UserRepository extends BaseRepository {
  /// Location of user profiles are stored on the database.
  static const String _profilesTable = "user_profiles";
  CollectionReference get _collection => getCollection(_profilesTable);

  Future<void> updateUser(UserModel user) async {
    OperationResult result = const OperationResult.success();
    final profileImage = user.profileImage;
    String? profilePath;
    try {
      if (profileImage!.isLocal) {
        result = await FirebaseStorageManager.uploadFileBytes(
          cloudPath: "${user.id}/profile_image.${profileImage.fileExtension}",
          fileData: profileImage.imageData!,
        );
        final isFailure = result.when(
          failure: (_) => true,
          success: (path) {
            profilePath = path;
            return false;
          },
        );
        if (isFailure) {
          addResultToStream(result);
          return;
        }
      }

      await _collection.doc(user.id.toString()).set(user
          .copyWith(
            profileImage: ImageModel(
              imageURL: profilePath ?? profileImage.imageURL,
              fileExtension: profileImage.fileExtension,
            ),
            updatedAt: DateTime.now(),
          )
          .toJson());
    } on FirebaseException catch (error) {
      logException("Exception in updateUser", error: error, stackTrace: error.stackTrace);
      result = OperationResult.failure("error_udating_user".tr());
    } catch (e, stackTrace) {
      logException("Exception in updateUser", error: e, stackTrace: stackTrace);
      result = OperationResult.failure("unkown_error".tr());
    }
    addResultToStream(result);
  }
}
