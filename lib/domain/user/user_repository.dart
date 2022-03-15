import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:refugee_help/domain/core/base_repository.dart';
import 'package:refugee_help/domain/core/image_model.dart';
import 'package:refugee_help/domain/core/operation_result.dart';
import 'package:refugee_help/domain/user/user_model.dart';
import 'package:refugee_help/domain/util/firebase_storage_utils.dart';

/// Repository class used for the authentication process
class UserRepository extends BaseRepository {
  /// Location of user profiles are stored on the database.
  static const String _profilesTable = "user_profiles";
  CollectionReference get _collection => getCollection(_profilesTable);

  Future<void> updateUser(UserModel user) async {
    OperationResult? result;
    ImageModel profileImage = user.profileImage!;
    try {
      if (profileImage.isLocal) {
        result = await FirebaseStorageUtils.uploadData(
          cloudPath: "${user.id}/profile_image.${profileImage.fileExtension}",
          fileData: profileImage.imageData!,
        );
        final isFailure = result.when(
          failure: (_) => true,
          success: (url) {
            profileImage = profileImage.copyWith(imageURL: url);
            return false;
          },
        );
        if (isFailure) {
          addResultToStream(result);
          return;
        }
      }

      result = const OperationResult.success();
      final updatedUser = user.copyWith(profileImage: profileImage, updatedAt: DateTime.now());
      await _collection.doc(user.id.toString()).update(updatedUser.toJson());
    } on FirebaseException catch (error) {
      logException("Exception in updateUser", error: error, stackTrace: error.stackTrace);
      result = OperationResult.failure("error_udating_user".tr());
    } catch (e, stackTrace) {
      logException("Exception in updateUser", error: e, stackTrace: stackTrace);
      result = OperationResult.failure("error_udating_user".tr());
    }
    addResultToStream(result);
  }

  Future<void> updateAvailability(UserModel user) async {
    OperationResult<String> result = OperationResult.success(
      user.isAvailable! ? "available".tr() : "unavailable".tr(),
    );
    try {
      await _collection
          .doc(user.id.toString())
          .update(user.copyWith(updatedAt: DateTime.now()).availabilityJson);
    } on FirebaseException catch (error) {
      logException("Exception in updateAvailability", error: error, stackTrace: error.stackTrace);
      result = OperationResult.failure("error_udating_user".tr());
    } catch (e, stackTrace) {
      logException("Exception in updateAvailability", error: e, stackTrace: stackTrace);
      result = OperationResult.failure("error_udating_user".tr());
    }
    addResultToStream(result);
  }
}
