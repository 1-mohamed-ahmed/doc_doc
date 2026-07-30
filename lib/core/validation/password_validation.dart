class PasswordValidation {
  static String? passwordSignIn(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    } else if (value.length < 8) {
      return "Password must be at least 8 characters";
    }

    return null;
  }

  static String? passwordSignUp(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    }

    final passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$',
    );

    if (!passwordRegex.hasMatch(value)) {
      return "Password must contain:\n"
          "- 8+ characters\n"
          "- Uppercase letter\n"
          "- Lowercase letter\n"
          "- Number\n"
          "- Special character";
    }
    return null;
  }

  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return "Please confirm your password";
    }

    if (value != password) {
      return "Passwords do not match";
    }

    return null;
  }
}
