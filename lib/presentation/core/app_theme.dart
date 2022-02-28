import 'dart:math';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static const Color _primaryLight = Color(0xff0057B7);
  static const Color _primaryLightVariant = Color(0xff4EB2FF);
  static const Color _secondaryLight = Color(0xffffd700);
  static const Color _secondaryLightVariant = Color(0xffFDE27C);

  static ThemeData get appTheme => ThemeData(
        primaryColor: _primaryLight,
        primarySwatch: _generateSwatch(_primaryLight),
        brightness: Brightness.light,
        textTheme: ThemeData.light().textTheme,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: _generateSwatch(_primaryLight),
          accentColor: _secondaryLight,
          brightness: Brightness.light,
        ).copyWith(
          primaryVariant: _primaryLightVariant,
          secondaryVariant: _secondaryLightVariant,
        ),
      );

  static const Color _primaryDark = Color(0xffabc7ff);
  static const Color _primaryDarkVariant = Color(0xff004495);
  static const Color _secondaryDark = Color(0xffeac400);
  static const Color _secondaryDarkVariant = Color(0xff554600);

  static ThemeData get appThemeDark => ThemeData(
        primaryColor: _primaryDark,
        primarySwatch: _generateSwatch(_primaryDark),
        brightness: Brightness.dark,
        textTheme: ThemeData.dark().textTheme,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: _generateSwatch(_primaryDark),
          accentColor: _secondaryDark,
          brightness: Brightness.dark,
        ).copyWith(
          primaryVariant: _primaryDarkVariant,
          secondaryVariant: _secondaryDarkVariant,
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
