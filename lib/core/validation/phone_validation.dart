import 'package:intl_phone_field/phone_number.dart';

class PhoneValidation {
  static String? phone(PhoneNumber? value) {
    if (value == null || value.number.trim().isEmpty) {
      return "Please enter your phone number";
    }

    if (!RegExp(r'^01[0125][0-9]{8}$').hasMatch(value.number)) {
      return "Please enter a valid Egyptian phone number";
    }

    return null;
  }
}
