import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refugee_help/application/bloc_initialiser.dart';
import 'package:refugee_help/application/simple_bloc_observer.dart';
import 'package:refugee_help/presentation/app_root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // if (kReleaseMode) await setupFirebaseCrashlytics();
  await EasyLocalization.ensureInitialized();

  BlocOverrides.runZoned(
    () => runApp(
      EasyLocalization(
        supportedLocales: const [Locale('en' 'US'), Locale('ro', 'RO')],
        path: 'assets/translations',
        child: const BlocInitialiser(appRoot: AppRoot()),
      ),
    ),
    blocObserver: SimpleBlocObserver(),
  );
}
