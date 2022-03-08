import 'package:flutter/material.dart';

/// Show errors to the users using a pre-defined [SnackBar].
void showErrorSnackBar(
  BuildContext context, {
  required String message,
  SnackBarBehavior? behavior,
}) =>
    showStandardSnackBar(
      context,
      message: message,
      icon: const Icon(Icons.error, color: Colors.white),
      backgroundColor: Colors.red,
      behavior: behavior,
    );

/// Show an operation is successful to the users using a pre-defined [SnackBar].
void showSuccessSnackBar(
  BuildContext context, {
  required String message,
  SnackBarBehavior? behavior,
}) =>
    showStandardSnackBar(
      context,
      message: message,
      icon: Icon(
        Icons.check,
        color: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white,
      ),
      behavior: behavior,
    );

/// Show an operation is in progress (such as: loading data, registering, signing in, etc.) to the users using a pre-defined [SnackBar].
void showLoadingSnackBar(BuildContext context, {required String message}) => showStandardSnackBar(
      context,
      message: message,
      icon: CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
      ),
      duration: 600,
    );

/// Show a pre-defined [SnackBar] to to user.
///
/// Used as a shorthand function for easy access to the [SnackBar] functionality.
void showStandardSnackBar(
  BuildContext context, {
  required String? message,
  required Widget icon,
  Color? backgroundColor,
  int duration = 4,
  SnackBarBehavior? behavior,
}) =>
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: behavior,
          duration: Duration(seconds: duration),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Flexible(child: Text('$message')), icon],
          ),
          backgroundColor: backgroundColor,
        ),
      );
