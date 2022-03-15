import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class ChrashlyticsUtils {
  static FirebaseCrashlytics get _crashlytics => FirebaseCrashlytics.instance;
  ChrashlyticsUtils._();

  static Future<void> initialize() async {
    if (!kReleaseMode || kIsWeb) return;

    FlutterError.onError = _crashlytics.recordFlutterError;
    await _crashlytics.setCrashlyticsCollectionEnabled(true);
  }

  static Future<void> log(String message) async {
    if (!kReleaseMode || kIsWeb) return;

    _crashlytics.log(message);
  }

  static Future<void> recordError(
    dynamic exception,
    StackTrace? stack, {
    dynamic reason,
    Iterable<DiagnosticsNode> information = const [],
    bool? printDetails,
    bool fatal = false,
  }) async {
    if (!kReleaseMode || kIsWeb) return;

    _crashlytics.recordError(
      exception,
      stack,
      reason: reason,
      information: information,
      printDetails: printDetails,
      fatal: fatal,
    );
  }
}
