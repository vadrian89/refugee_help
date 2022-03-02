import 'package:bloc/bloc.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:logger/logger.dart';

/// Class used to debug bloc workflow.
class SimpleBlocObserver extends BlocObserver {
  final Logger _logger = Logger();

  @override
  void onEvent(Bloc bloc, Object? event) {
    _logger.i(event);
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    _logger.e("$bloc error: $error");
    // FirebaseCrashlytics.instance.recordError(error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    _logger.i("$bloc transition: $transition");
    super.onTransition(bloc, transition);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    _logger.i("$bloc change: $change");
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    _logger.i(bloc);
    super.onClose(bloc);
  }
}
