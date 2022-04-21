import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:refugee_help/domain/core/base_repository.dart';
import 'package:refugee_help/domain/core/crud_repository_interface.dart';
import 'package:refugee_help/domain/core/image_model.dart';
import 'package:refugee_help/domain/core/operation_result.dart';
import 'package:refugee_help/domain/util/firebase_storage_utils.dart';
import 'package:uuid/uuid.dart';

import 'housing_model.dart';
import 'list_housing_request_model.dart';
// import 'list_housing_request_model.dart';

/// Repository class used for the authentication process
class HousingRepository extends BaseRepository implements CrudRepositoryInterface<HousingModel> {
  /// Location in the database.
  String get _colName => BaseRepository.housingCollection;
  CollectionReference get _collection => getCollection(_colName);

  CollectionReference<HousingModel> get _reference => _collection.withConverter<HousingModel>(
        fromFirestore: (snapshot, _) => HousingModel.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.updatedIndexes.toJson(),
      );

  Future<void> updateAvailability(HousingModel model) async {
    OperationResult<String> result = OperationResult.success(
      model.isAvailable! ? "available".tr() : "unavailable".tr(),
    );
    logDebug("updateAvailability housing: $model", local: true);
    try {
      await _reference.doc(model.id.toString()).update(model.updated.availabilityJson);
    } on FirebaseException catch (error) {
      logException("Exception in updateAvailability", error: error, stackTrace: error.stackTrace);
      result = OperationResult.failure("error_saving_housing".tr());
    } catch (e, stackTrace) {
      logException("Exception in updateAvailability", error: e, stackTrace: stackTrace);
      result = OperationResult.failure("error_saving_housing".tr());
    }
    addResultToStream(result);
  }

  @override
  Future<void> add(HousingModel model) async {
    OperationResult<bool> result = const OperationResult.success(true);
    try {
      final doc = await _reference.add(model);
      HousingModel updatedModel = model.copyWith(id: doc.id);

      List<ImageModel> imageList = List.generate(
        updatedModel.imageList!.length,
        (index) => _updateStoragePath(housing: updatedModel, image: updatedModel.imageList![index]),
      );

      final uploadResult = await FirebaseStorageUtils.uploadImageList(imageList);
      final isFailure = uploadResult.when(
        failure: (_) => true,
        success: (list) {
          imageList = List.generate(list!.length, (index) => list[index]);
          return false;
        },
      );
      if (isFailure) {
        addResultToStream(uploadResult);
        delete(updatedModel);
        return;
      }
      await _reference
          .doc(updatedModel.id)
          .update(updatedModel.copyWith(imageList: imageList).toJson());
    } on FirebaseException catch (error) {
      logException("Exception in add", error: error, stackTrace: error.stackTrace);
      result = OperationResult.failure("error_saving_housing".tr());
    } catch (e, stackTrace) {
      logException("Exception in add", error: e, stackTrace: stackTrace);
      result = OperationResult.failure("error_saving_housing".tr());
    }
    addResultToStream(result);
  }

  @override
  Future<void> update(HousingModel model) async {
    OperationResult? result;
    List<ImageModel> cloudImages = List.from(model.cloudImages);
    try {
      if (model.hasImagesToDelete) {
        final deleteResult = await FirebaseStorageUtils.deleteImageList(model.imagesToDelete!);
        final isFailure = deleteResult.when(failure: (_) => true, success: (_) => false);
        if (isFailure) {
          addResultToStream(deleteResult);
          return;
        }
      }
      if (model.hasLocalImages) {
        List<ImageModel> imageList = List.generate(
          model.localImages.length,
          (index) => _updateStoragePath(housing: model, image: model.localImages[index]),
        );

        final uploadResult = await FirebaseStorageUtils.uploadImageList(imageList);
        final isFailure = uploadResult.when(
          failure: (_) => true,
          success: (list) {
            imageList = List.generate(list!.length, (index) => list[index]);
            return false;
          },
        );
        if (isFailure) {
          addResultToStream(uploadResult);
          return;
        }

        cloudImages = List.from([...cloudImages, ...imageList]);
      }

      final updatedModel = model.copyWith(imageList: cloudImages, updatedAt: DateTime.now());
      await _reference.doc(model.id).update(updatedModel.updatedIndexes.toJson());
    } on FirebaseException catch (error) {
      logException("Exception in update", error: error, stackTrace: error.stackTrace);
      result = OperationResult.failure("error_saving_housing".tr());
    } catch (e, stackTrace) {
      logException("Exception in update", error: e, stackTrace: stackTrace);
      result = OperationResult.failure("error_saving_housing".tr());
    }
    if (result != null) {
      addResultToStream(result);
    }
  }

  @override
  Future<void> delete(HousingModel model, {bool popScreen = false}) async {
    OperationResult<bool> result = OperationResult.success(popScreen);
    try {
      await FirebaseStorageUtils.deleteAll(model.storagePath);
      await _reference.doc(model.id).delete();
    } on FirebaseException catch (error) {
      logException("Exception in delete", error: error, stackTrace: error.stackTrace);
      result = OperationResult.failure("error_deleting_housing".tr());
    } catch (e, stackTrace) {
      logException("Exception in delete", error: e, stackTrace: stackTrace);
      result = OperationResult.failure("error_deleting_housing".tr());
    }
    addResultToStream(result);
  }

  @override
  Stream<HousingModel?> docStream(String id) async* {
    yield* _reference.doc(id).snapshots().map((doc) => doc.data()?.copyWith(id: id));
  }

  Stream<List<HousingModel>> listStream(ListHousingRequestModel request) async* {
    Query<HousingModel> query = _reference;
    if (request.userId != null) {
      query = query.where("user.id", isEqualTo: request.userId);
    }
    if (request.county != null) {
      query = query
          .where("county", isGreaterThanOrEqualTo: request.county!.toLowerCase())
          .where("county", isLessThanOrEqualTo: "${request.county!.toLowerCase()}z");
    }
    if (request.city != null) {
      query = query
          .where("city", isGreaterThanOrEqualTo: request.city!.toLowerCase())
          .where("city", isLessThanOrEqualTo: "${request.city!.toLowerCase()}z");
    }
    if (request.type != null) {
      query = query.where("type.id", isEqualTo: request.type!.id);
    }
    if (request.bedsAvailable != null) {
      query = query.where("bedsAvailable", isEqualTo: request.bedsAvailable);
    } else {
      query = query.orderBy("bedsAvailable", descending: true);
    }
    if (request.isAvailable != null) {
      query = query.where("isAvailable", isEqualTo: request.isAvailable);
    }
    query = query.orderBy("updatedAt", descending: true);
    if (request.limit != null) {
      query = query.limit(request.limit!);
    }
    logDebug("Firebase query ${query.parameters}", local: true);
    yield* query.snapshots(includeMetadataChanges: true).asyncMap(_listFromSnapshot);
  }

  Future<List<HousingModel>> _listFromSnapshot(QuerySnapshot<HousingModel>? snapshot) async {
    if (snapshot?.docs.isNotEmpty ?? false) {
      return snapshot!.docs.map((doc) => doc.data().copyWith(id: doc.id)).toList();
    }
    return const [];
  }

  ImageModel _updateStoragePath({
    required HousingModel housing,
    required ImageModel image,
  }) =>
      image.copyWith(
        storagePath: "${housing.storagePath}/${const Uuid().v4()}.${image.fileExtension}",
      );
}
