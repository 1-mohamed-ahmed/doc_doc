import 'package:flutter/material.dart';

class PasswordValidationsWidget extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  const PasswordValidationsWidget({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        const SizedBox(height: 2),
        buildValidationRow('At least 1 uppercase letter', hasUpperCase),
        const SizedBox(height: 2),
        buildValidationRow(
          'At least 1 special character',
          hasSpecialCharacters,
        ),
        const SizedBox(height: 2),
        buildValidationRow('At least 1 number', hasNumber),
        const SizedBox(height: 2),
        buildValidationRow('At least 8 characters long', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5,
          backgroundColor: hasValidated ? Colors.green : Colors.grey,
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: hasValidated ? Colors.grey : Colors.red,
            decoration: hasValidated ? TextDecoration.lineThrough : null,
          ),
        ),
      ],
    );
  }
}
