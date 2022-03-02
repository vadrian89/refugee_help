import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/bloc_initialiser.dart';
import 'package:refugee_help/application/bloc_observer.dart';
import 'package:refugee_help/presentation/app_root.dart';

import 'domain/util/firebase_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (kReleaseMode) await setupFirebaseCrashlytics();
  await EasyLocalization.ensureInitialized();

  BlocOverrides.runZoned(
    () => runApp(
      EasyLocalization(
        supportedLocales: const [Locale('en' 'US'), Locale('ro', 'RO')],
        path: 'assets/translations',
        child: BlocInitialiser(appRoot: AppRoot()),
      ),
    ),
    blocObserver: SimpleBlocObserver(),
  );
}
