import 'dart:math';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static const Color _primaryColor = Color(0xff0057b7);
  static const Color _secondaryColor = Color(0xffffd700);

  static MaterialColor get _primarySwatch => _generateSwatch(_primaryColor);

  static ThemeData get appTheme => ThemeData.light().copyWith(
        primaryColor: _primaryColor,
        textTheme: ThemeData.light().textTheme,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: _primarySwatch,
          accentColor: _secondaryColor,
          brightness: Brightness.light,
        ),
      );

  static ThemeData get appThemeDark => ThemeData.dark().copyWith(
        primaryColor: _primaryColor,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: _primarySwatch,
          accentColor: _secondaryColor,
          brightness: Brightness.dark,
        ),
      );

  static MaterialColor _generateSwatch(Color color) => MaterialColor(color.value, {
        50: _tintColor(color, 0.9),
        100: _tintColor(color, 0.8),
        200: _tintColor(color, 0.6),
        300: _tintColor(color, 0.4),
        400: _tintColor(color, 0.2),
        500: color,
        600: _shadeColor(color, 0.1),
        700: _shadeColor(color, 0.2),
        800: _shadeColor(color, 0.3),
        900: _shadeColor(color, 0.4),
      });

  static int _tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  static Color _tintColor(Color color, double factor) => Color.fromRGBO(
      _tintValue(color.red, factor),
      _tintValue(color.green, factor),
      _tintValue(color.blue, factor),
      1);

  static int _shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  static Color _shadeColor(Color color, double factor) => Color.fromRGBO(
        _shadeValue(color.red, factor),
        _shadeValue(color.green, factor),
        _shadeValue(color.blue, factor),
        1,
      );
}
