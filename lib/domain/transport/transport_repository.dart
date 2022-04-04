import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:refugee_help/domain/core/base_repository.dart';
import 'package:refugee_help/domain/core/crud_repository_interface.dart';
import 'package:refugee_help/domain/core/firestore_pagination_info.dart';
import 'package:refugee_help/domain/core/image_model.dart';
import 'package:refugee_help/domain/core/operation_result.dart';
import 'package:refugee_help/domain/util/firebase_storage_utils.dart';
import 'package:refugee_help/infrastructure/utils.dart';

import 'transport_model.dart';
import 'transport_request.dart';

/// Repository class used for the authentication process
class TransportRepository extends BaseRepository
    implements CrudRepositoryInterface<TransportModel> {
  /// Location in the database.
  String get _colName => BaseRepository.transportCollection;
  String get _counterDoc => "${_colName}_counter";
  CollectionReference get _collection => getCollection(_colName);

  CollectionReference<TransportModel> get _reference => _collection.withConverter<TransportModel>(
        fromFirestore: (snapshot, _) => TransportModel.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );

  Future<void> updateAvailability(TransportModel model) async {
    OperationResult<String> result = OperationResult.success(
      model.isAvailable! ? "available".tr() : "unavailable".tr(),
    );
    logDebug("updateAvailability transport: $model", local: true);
    try {
      await _reference
          .doc(model.id.toString())
          .update(model.copyWith(updatedAt: DateTime.now()).availabilityJson);
    } on FirebaseException catch (error) {
      logException("Exception in updateAvailability", error: error, stackTrace: error.stackTrace);
      result = OperationResult.failure("error_udating_user".tr());
    } catch (e, stackTrace) {
      logException("Exception in updateAvailability", error: e, stackTrace: stackTrace);
      result = OperationResult.failure("error_udating_user".tr());
    }
    addResultToStream(result);
  }

  @override
  Future<void> add(TransportModel model) async {
    OperationResult<bool> result = const OperationResult.success(true);
    ImageModel image = model.image!;
    TransportModel updatedModel = model;
    try {
      final doc = await _reference.add(model.copyWith(image: image));
      updatedModel = updatedModel.copyWith(id: doc.id);

      OperationResult uploadResult = await FirebaseStorageUtils.uploadData(
        cloudPath: updatedModel.imageStoragePath,
        fileData: image.imageData!,
      );
      final isFailure = uploadResult.when(
        failure: (_) => true,
        success: (url) {
          image = image.copyWith(imageURL: url);
          return false;
        },
      );
      if (isFailure) {
        addResultToStream(uploadResult);
        delete(updatedModel);
        return;
      }
      await _reference.doc(updatedModel.id).update(updatedModel.copyWith(image: image).toJson());
      await incrementCount(_counterDoc);
    } on FirebaseException catch (error) {
      logException("Exception in add", error: error, stackTrace: error.stackTrace);
      result = OperationResult.failure("error_saving_transport".tr());
    } catch (e, stackTrace) {
      logException("Exception in add", error: e, stackTrace: stackTrace);
      result = OperationResult.failure("error_saving_transport".tr());
    }
    addResultToStream(result);
  }

  @override
  Future<void> update(TransportModel model) async {
    OperationResult? result;
    ImageModel image = model.image!;
    try {
      if (image.isLocal) {
        final uploadResult = await FirebaseStorageUtils.uploadData(
          cloudPath: model.imageStoragePath,
          fileData: image.imageData!,
        );
        final isFailure = uploadResult.when(
          failure: (_) => true,
          success: (url) {
            image = image.copyWith(imageURL: url);
            return false;
          },
        );
        if (isFailure) {
          addResultToStream(uploadResult);
          return;
        }
      }

      final updatedModel = model.copyWith(image: image, updatedAt: DateTime.now());
      await _reference.doc(model.id).update(updatedModel.toJson());
    } on FirebaseException catch (error) {
      logException("Exception in update", error: error, stackTrace: error.stackTrace);
      result = OperationResult.failure("error_saving_transport".tr());
    } catch (e, stackTrace) {
      logException("Exception in update", error: e, stackTrace: stackTrace);
      result = OperationResult.failure("error_saving_transport".tr());
    }
    if (result != null) {
      addResultToStream(result);
    }
  }

  @override
  Future<void> delete(TransportModel model, {bool popScreen = false}) async {
    OperationResult<bool> result = OperationResult.success(popScreen);
    try {
      await FirebaseStorageUtils.deleteFile(model.imageStoragePath);
      await _reference.doc(model.id).delete();
      await decrementCount(_counterDoc);
    } on FirebaseException catch (error) {
      logException("Exception in delete", error: error, stackTrace: error.stackTrace);
      result = OperationResult.failure("error_deleting_transport".tr());
    } catch (e, stackTrace) {
      logException("Exception in delete", error: e, stackTrace: stackTrace);
      result = OperationResult.failure("error_deleting_transport".tr());
    }
    addResultToStream(result);
  }

  @override
  Stream<TransportModel?> docStream(String id) async* {
    yield* _reference.doc(id).snapshots().map((doc) => doc.data()?.copyWith(id: id));
  }

  Stream<List<TransportModel>> listStream({
    TransportRequest? request,
    int limit = 10,
    String? userId,
  }) async* {
    Query<TransportModel> query = _reference;
    if (userId != null) {
      query = query.where("user.id", isEqualTo: userId);
    }
    if (request?.seatsAvailable != null) {
      query = query.where("seatsAvailable", isEqualTo: request?.seatsAvailable);
    }
    if (request?.transportType != null) {
      query = query.where("type", isEqualTo: request?.transportType!.id);
    }
    if (request?.isAvailable ?? false) {
      query = query.where("isAvailable", isEqualTo: request?.isAvailable);
    }
    query = query.orderBy("timeAvailable").orderBy("updatedAt", descending: true);
    query = pagedQuery<TransportModel>(
      query: query,
      paginationInfo: request?.paginationInfo,
      goBack: request?.goBack ?? false,
      limit: limit,
    );
    logDebug("Firebase query ${query.parameters}", local: true);
    yield* query.snapshots(includeMetadataChanges: true).asyncMap(_listFromSnapshot);
  }

  Future<List<TransportModel>> _listFromSnapshot(QuerySnapshot<TransportModel>? snapshot) async {
    if (snapshot?.docs.isNotEmpty ?? false) {
      addResultToStream(OperationResult.success(FirestorePaginationInfo(
        firstDoc: snapshot!.docs.first,
        lastDoc: snapshot.docs.last,
      )));
      addResultToStream(OperationResult.success(await getTotalCount()));
      await Utils.streamDelay();
      return snapshot.docs.map((doc) => doc.data().copyWith(id: doc.id)).toList();
    }
    return [];
  }

  Future<int> getTotalCount() => count(_counterDoc);
}
