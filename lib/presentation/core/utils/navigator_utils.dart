import 'package:flutter/material.dart';

class NavigatorUtils {
  static Future<T?> push<T extends Object?>(
    BuildContext context, {
    required Widget screen,
  }) async =>
      await Navigator.push<T>(
        context,
        MaterialPageRoute<T>(builder: (context) => screen),
      );

  static Future<T?> replace<T extends Object?, TO extends Object?>(
    BuildContext context, {
    required Widget screen,
  }) async {
    return await Navigator.pushReplacement<T, TO>(
      context,
      MaterialPageRoute<T>(builder: (context) => screen),
    );
  }
}
