import 'package:flutter/material.dart';
import 'package:refugee_help/application/root_router/root_router_cubit.dart';

/// The base for more complex router states.
///
/// When a [RootRouterState] contains more then 2 parameters the code becomes harder to maintain,
/// so in order to make the code more readable and maintainable we make custom state classes for them.
@immutable
abstract class RouterStateConfig {
  /// Retrieve the URI based on the provided arguments.
  Uri get uri;

  /// Convert the current state to [RootRouterState].
  RootRouterState get state;

  /// Get the path with or without [Uri.queryParamaters].
  String get uriPpath => uri.queryParameters.isNotEmpty ? uri.toString() : uri.path;

  const RouterStateConfig();

  /// Get the path or empty string if the expression is `true`.
  String getPath([bool? expression, String path = ""]) => (expression ?? false) ? path : "";

  /// Return a [Uri] query parameter if the [value] is not empty.
  String getParameter(String name, String value) {
    if (value.trim().isEmpty) return "";

    return "$name=$value";
  }
}
