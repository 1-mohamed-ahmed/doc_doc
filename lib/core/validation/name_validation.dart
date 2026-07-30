class NameValidation {
  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Name is required";
    }

    if (value.trim().length < 3) {
      return "Name must be at least 3 characters";
    }

    if (value.trim().length > 30) {
      return "Name is too long";
    }

    if (!RegExp(r'^[a-zA-Zأ-ي\s]+$').hasMatch(value.trim())) {
      return "Name can only contain letters";
    }

    return null;
  }
}
