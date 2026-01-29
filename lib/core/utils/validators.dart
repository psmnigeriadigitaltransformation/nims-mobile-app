/// Phone number validation utilities
class PhoneValidator {
  static const int phoneLength = 11;
  static final RegExp _digitsOnly = RegExp(r'^[0-9]+$');

  /// Validates a phone number and returns an error message if invalid.
  /// Returns null if the phone number is valid or empty.
  static String? validate(String phoneNumber) {
    if (phoneNumber.isEmpty) return null;
    if (phoneNumber.length != phoneLength) {
      return "Phone number must be $phoneLength digits";
    }
    if (!_digitsOnly.hasMatch(phoneNumber)) {
      return "Phone number must contain only digits";
    }
    return null;
  }

  /// Returns true if the phone number is valid (11 digits, numbers only)
  static bool isValid(String phoneNumber) =>
      phoneNumber.length == phoneLength && _digitsOnly.hasMatch(phoneNumber);
}
