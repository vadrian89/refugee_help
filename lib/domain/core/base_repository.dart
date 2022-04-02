import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:refugee_help/domain/core/firestore_pagination_info.dart';
import 'package:refugee_help/infrastructure/firebase/chrashlytics_utils.dart';

import 'operation_result.dart';

/// Base class for all repositories.
///
/// Should contain all common properties used in repositories classes.
abstract class BaseRepository {
  static const String _project = 'refugee_help';
  static const String transportCollection = "volunteer_transport";
  static const String ticketsCollection = "tickets";
  static const int _shardsCount = 2;

  late final Logger _logger;
  StreamController<OperationResult>? __resultStreamController;
  StreamController<OperationResult> get _resultStreamController =>
      __resultStreamController ??= StreamController<OperationResult>.broadcast();

  Stream<OperationResult> get resultStream => _resultStreamController.stream;

  BaseRepository({Logger? logger, bool initHttpClient = true}) : _logger = logger ?? Logger() {
    _logger.i("Initialising repository $this");
  }

  /// Log debug messages.
  void logDebug(String message, {dynamic error, StackTrace? stackTrace, bool local = false}) {
    if (!local) {
      ChrashlyticsUtils.log(message);
    }
    _logger.d(message, error, stackTrace);
  }

  /// Log exceptions caught.
  void logException(String message, {dynamic error, StackTrace? stackTrace}) {
    ChrashlyticsUtils.log(message);
    ChrashlyticsUtils.recordError(error, stackTrace);
    _logger.e(message, error, stackTrace);
  }

  void addResultToStream(OperationResult result) => _resultStreamController.add(result);

  @protected
  CollectionReference getCollection(String collection) {
    if (collection == "user_profiles") {
      return FirebaseFirestore.instance.collection(collection);
    }
    return FirebaseFirestore.instance.collection("${_project}_${collection.toLowerCase()}");
  }

  Map<String, dynamic>? mapFromObject(Object? object) => object as Map<String, dynamic>?;

  Future<int> count(String docName) async {
    final docPath = "counters/$docName";
    int count = 0;
    final fb = FirebaseFirestore.instance;
    DocumentSnapshot document = await fb.doc(docPath).get();
    if (!document.exists) {
      await _initializeCounterShards(document.reference);
      document = await fb.doc(docPath).get();
    }
    final shardsCollection = await document.reference.collection("shards").get();
    for (final doc in shardsCollection.docs) {
      count += (mapFromObject(doc.data())?["count"] as int? ?? 0);
    }
    return count;
  }

  Future<void> incrementCount(String docName) => _updateCount(docName);

  Future<void> decrementCount(String docName) => _updateCount(docName, -1);

  Future<void> _updateCount(String docName, [int value = 1]) async {
    final docPath = "counters/$docName";
    final fb = FirebaseFirestore.instance;
    DocumentSnapshot document = await fb.doc(docPath).get();
    if (!document.exists) {
      await _initializeCounterShards(document.reference);
      document = await fb.doc(docPath).get();
    }
    final shardId = Random().nextInt(mapFromObject(document.data())?["shardsCount"] as int? ?? 0);
    final colRef = document.reference.collection("shards");
    await colRef.doc(shardId.toString()).update({"count": FieldValue.increment(value)});
  }

  Future<void> _initializeCounterShards(DocumentReference docRef) async {
    WriteBatch batch = FirebaseFirestore.instance.batch();

    batch.set(docRef, {"shardsCount": _shardsCount});

    for (int i = 0; i < _shardsCount; i++) {
      final shardRef = docRef.collection('shards').doc(i.toString());
      batch.set(shardRef, {"count": 0});
    }

    return batch.commit();
  }

  Query<T> pagedQuery<T>({
    required Query<T> query,
    FirestorePaginationInfo? paginationInfo,
    bool goBack = false,
    int limit = 10,
  }) {
    Query<T> newQuery = query;
    if (paginationInfo != null) {
      newQuery = goBack
          ? newQuery.endBeforeDocument(paginationInfo.firstDoc!)
          : newQuery.startAfterDocument(paginationInfo.lastDoc!);
    }
    newQuery =
        (goBack && paginationInfo != null) ? newQuery.limitToLast(limit) : newQuery.limit(limit);
    return newQuery;
  }

  /// Close all resources used in repository.
  @mustCallSuper
  Future<void> close() async {
    await __resultStreamController?.close();
    _logger.i("Closing repository $this");
    _logger.close();
  }
}
