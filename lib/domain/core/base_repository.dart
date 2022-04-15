import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:refugee_help/infrastructure/firebase/chrashlytics_utils.dart';

import 'operation_result.dart';

/// Base class for all repositories.
///
/// Should contain all common properties used in repositories classes.
abstract class BaseRepository {
  static const String _project = 'refugee_help';
  static const String transportCollection = "volunteer_transport";
  static const String housingCollection = "volunteer_housing";
  static const String ticketsCollection = "tickets";

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

  /// Close all resources used in repository.
  @mustCallSuper
  Future<void> close() async {
    await __resultStreamController?.close();
    _logger.i("Closing repository $this");
    _logger.close();
  }
}
