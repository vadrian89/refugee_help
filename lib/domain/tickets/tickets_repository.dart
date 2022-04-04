import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:refugee_help/domain/core/base_repository.dart';
import 'package:refugee_help/domain/core/crud_repository_interface.dart';
import 'package:refugee_help/domain/core/firestore_pagination_info.dart';
import 'package:refugee_help/domain/core/operation_result.dart';
import 'package:refugee_help/domain/tickets/ticket_request.dart';
import 'package:refugee_help/domain/transport/transport_repository.dart';
import 'package:refugee_help/infrastructure/utils.dart';

import 'ticket_model.dart';
import 'ticket_status_model.dart';
import 'ticket_type_model.dart';

/// Repository class used for the authentication process
class TicketsRepository extends BaseRepository implements CrudRepositoryInterface<TicketModel> {
  TransportRepository? __transportRepo;
  TransportRepository get _transportRepo => __transportRepo ??= TransportRepository();
  StreamSubscription<OperationResult>? __transportResultSub;
  StreamSubscription<OperationResult> get _transportResultSub =>
      __transportResultSub ??= _transportRepo.resultStream.listen(addResultToStream);

  /// Location in the database.
  String get _colName => BaseRepository.ticketsCollection;
  String get _counterDoc => "${_colName}_counter";
  CollectionReference get _collection => getCollection(_colName);

  TicketsRepository();

  CollectionReference<TicketModel> get _reference => _collection.withConverter<TicketModel>(
        fromFirestore: (snapshot, _) => TicketModel.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson(),
      );

  @override
  Future<void> add(TicketModel model) async {
    OperationResult<bool> result = const OperationResult.success(true);
    try {
      await _reference.add(model);
      await incrementCount("${model.type!.name}_$_counterDoc");
    } on FirebaseException catch (error) {
      logException("Exception in add", error: error, stackTrace: error.stackTrace);
      result = OperationResult.failure("ticket.error_saving".tr());
    } catch (e, stackTrace) {
      logException("Exception in add", error: e, stackTrace: stackTrace);
      result = OperationResult.failure("ticket.error_saving".tr());
    }
    addResultToStream(result);
  }

  @override
  Future<void> update(TicketModel model) async {
    OperationResult? result;
    try {
      await _reference.doc(model.id).update(model.toJson());
    } on FirebaseException catch (error) {
      logException("Exception in update", error: error, stackTrace: error.stackTrace);
      result = OperationResult.failure("ticket.error_saving".tr());
    } catch (e, stackTrace) {
      logException("Exception in update", error: e, stackTrace: stackTrace);
      result = OperationResult.failure("ticket.error_saving".tr());
    }
    if (result != null) {
      addResultToStream(result);
    }
  }

  Future<void> updateStatus(TicketModel model) async {
    await update(model);
    if (model.status == TicketStatusModel.started()) {
      await _transportRepo.updateAvailability(model.unavailableTransport);
    }
  }

  @override
  Future<void> delete(TicketModel model, {bool popScreen = false}) async {
    OperationResult<bool> result = OperationResult.success(popScreen);
    try {
      await _reference.doc(model.id).delete();
      await decrementCount("${model.type!.name}_$_counterDoc");
    } on FirebaseException catch (error) {
      logException("Exception in delete", error: error, stackTrace: error.stackTrace);
      result = OperationResult.failure("ticket.error_deleting".tr());
    } catch (e, stackTrace) {
      logException("Exception in delete", error: e, stackTrace: stackTrace);
      result = OperationResult.failure("ticket.error_deleting".tr());
    }
    addResultToStream(result);
  }

  @override
  Stream<TicketModel?> docStream(String id) async* {
    yield* _reference
        .doc(id)
        .snapshots(includeMetadataChanges: true)
        .map((doc) => doc.data()?.copyWith(id: id));
  }

  Stream<List<TicketModel>> listStream({
    required TicketRequest request,
    int limit = 10,
    String? userId,
  }) async* {
    Query<TicketModel> query = _reference
        .where("type.id", isEqualTo: request.type!.id)
        .orderBy("createdAt", descending: true)
        .orderBy("adultsNumber", descending: true)
        .orderBy("childrenNumber", descending: true);
    if (userId != null) {
      query = query.where("transport.user.id", isEqualTo: userId);
    }
    query = pagedQuery<TicketModel>(
      query: query,
      paginationInfo: request.paginationInfo,
      goBack: request.goBack,
      limit: limit,
    );
    logDebug("Firebase query parameters ${query.parameters}", local: true);
    yield* query.snapshots().asyncMap((event) => _listFromSnapshot(request.type!, event));
  }

  Future<List<TicketModel>> _listFromSnapshot(
    TicketTypeModel type, [
    QuerySnapshot<TicketModel>? snapshot,
  ]) async {
    if (snapshot?.docs.isNotEmpty ?? false) {
      addResultToStream(OperationResult.success(FirestorePaginationInfo(
        firstDoc: snapshot!.docs.first,
        lastDoc: snapshot.docs.last,
      )));
      addResultToStream(OperationResult.success(await count("${type.name}_$_counterDoc")));
      await Utils.streamDelay();
      return snapshot.docs.map((doc) => doc.data().copyWith(id: doc.id)).toList();
    }
    return [];
  }

  @override
  Future<void> close() async {
    if (__transportResultSub != null) {
      await _transportResultSub.cancel();
    }
    if (__transportRepo != null) {
      await _transportRepo.close();
    }
    return super.close();
  }
}
