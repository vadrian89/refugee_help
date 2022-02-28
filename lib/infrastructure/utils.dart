import 'package:intl/intl.dart';

class Utils {
  static DateFormat get globalDateFormat => DateFormat("dd/MM/yyyy HH:mm");
  static DateFormat get onlyDateFormat => DateFormat("dd/MM/yyyy");
  static const int borderRadius = 4;

  Utils._();

  static Future<void> repoDelay([int milliseconds = 300]) =>
      Future.delayed(Duration(milliseconds: milliseconds));
  static Future<void> streamDelay() => repoDelay(150);
}
