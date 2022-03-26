/// A collection of validator functions used to validate data.
///
/// This class should contain all validators used throughout the app, whenever we need them.
class Validators {
  /// Make the constructor private because all the validator methods are static.
  const Validators._();

  static final _passwordRegExp = RegExp(
    r"^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})",
  );
  static final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9_\.!#$%\^&\*]+@[a-zA-Z_]+?\.[a-zA-Z]{2,20}$",
  );
  static final RegExp _phoneRegExp = RegExp(r"^\+40[0-9]{8,9}$");
  static final RegExp _numberExp = RegExp(r"^\d*[.|,]*\d+$");
  static final RegExp _integerExp = RegExp(r"^\d*$");

  /// Validate that the provided value is a valid e-mail.
  static bool isValidEmail([String? email]) => (email != null) && _emailRegExp.hasMatch(email);

  /// Validate that the provided value is a valid password.
  ///
  /// The value should:
  /// - not be null;
  /// - be at least 8 characters length;
  /// - should contain at least one uppercase;
  /// - should contain at least one lowercase;
  /// - should contain at least one special character;
  /// - should contain at least one digit;
  static bool isValidPassword([String? password]) =>
      (password != null) && _passwordRegExp.hasMatch(password);

  /// Validate phone number.
  static bool isValidPhone(String? string) =>
      (string?.isNotEmpty ?? false) && _phoneRegExp.hasMatch(string!);

  /// Validate the incoming string is a number.
  ///
  /// Validation is done with the following expression `^\d*[.|,]*\d+$`.
  static bool isNumber([String? string]) =>
      (string?.isNotEmpty ?? false) && _numberExp.hasMatch(string!);

  /// Validate the incoming string is an integer number.
  static bool isInteger([String? string]) =>
      (string?.isNotEmpty ?? false) && _integerExp.hasMatch(string!);
}
