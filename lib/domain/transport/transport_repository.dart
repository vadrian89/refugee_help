import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:refugee_help/domain/core/base_repository.dart';
import 'package:refugee_help/domain/core/crud_repository_interface.dart';
import 'package:refugee_help/domain/core/image_model.dart';
import 'package:refugee_help/domain/core/operation_result.dart';
import 'package:refugee_help/domain/util/firebase_storage_utils.dart';

import 'transport_model.dart';

/// Repository class used for the authentication process
class TransportRepository extends BaseRepository
    implements CrudRepositoryInterface<TransportModel> {
  /// Location of user profiles are stored on the database.
  static const String _profilesTable = "volunteer_transport";
  CollectionReference get _collection => getCollection(_profilesTable);

  CollectionReference<TransportModel> get _reference => _collection.withConverter<TransportModel>(
        fromFirestore: (snapshot, _) => TransportModel.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );

  Future<void> updateAvailability(TransportModel model) async {
    OperationResult<String> result = OperationResult.success(
      model.isAvailable! ? "available".tr() : "unavailable".tr(),
    );
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
    } on FirebaseException catch (error) {
      logException("Exception in update", error: error, stackTrace: error.stackTrace);
      result = OperationResult.failure("error_saving_transport".tr());
    } catch (e, stackTrace) {
      logException("Exception in update", error: e, stackTrace: stackTrace);
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
    } on FirebaseException catch (error) {
      logException("Exception in update", error: error, stackTrace: error.stackTrace);
      result = OperationResult.failure("error_saving_transport".tr());
    } catch (e, stackTrace) {
      logException("Exception in update", error: e, stackTrace: stackTrace);
      result = OperationResult.failure("error_saving_transport".tr());
    }
    addResultToStream(result);
  }

  @override
  Stream<TransportModel?> docStream(String id) async* {
    yield* _reference.doc(id).snapshots().map((doc) => doc.data()?.copyWith(id: id));
  }

  @override
  Stream<List<TransportModel>> listStream({String? userId, int limit = 10}) async* {
    Query<TransportModel> query = _reference;
    if (userId != null) {
      query = query.where("user.id", isEqualTo: userId);
    }
    yield* query.limit(limit).snapshots().map(_listFromSnapshot);
  }

  List<TransportModel> _listFromSnapshot(QuerySnapshot<TransportModel>? data) =>
      data?.docs.map((doc) => doc.data().copyWith(id: doc.id)).toList() ?? [];
}
