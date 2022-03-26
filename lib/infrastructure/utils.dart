import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static DateFormat get globalDateFormat => DateFormat("dd/MM/yyyy HH:mm");
  static DateFormat get onlyDateFormat => DateFormat("dd/MM/yyyy");
  static const int borderRadius = 4;

  Utils._();

  static Future<void> repoDelay([int milliseconds = 300]) =>
      Future.delayed(Duration(milliseconds: milliseconds));
  static Future<void> streamDelay() => repoDelay(150);

  static bool get isIos => !kIsWeb && Platform.isIOS;

  static String getImageMime(String path) {
    if (path.contains(".jpg") || path.contains(".jpeg")) {
      return "image/jpeg";
    }
    if (path.contains(".jpg")) {
      return "image/jpg";
    } else if (path.contains(".png")) {
      return "image/png";
    } else if (path.contains(".svg")) {
      return "image/svg+xml";
    } else if (path.contains(".apng")) {
      return "image/apng";
    } else if (path.contains(".bmp")) {
      return "image/bmp";
    } else if (path.contains(".gif")) {
      return "image/gif";
    } else if (path.contains(".webp")) {
      return "image/webp";
    } else {
      return "";
    }
  }

  static void call(String phoneNumber) => launchUrl("tel:$phoneNumber");

  static Future<void> launchUrl(String url) => canLaunch(url).then(
        (value) => value ? launch(url) : null,
      );
}
