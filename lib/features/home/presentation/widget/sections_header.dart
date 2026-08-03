import 'package:flutter/material.dart';

class SectionsHeader extends StatelessWidget {
  final void Function()? onPressed;
  final String sectionTitle;
  final String buttonText;
  final TextStyle textStyle;
  const SectionsHeader({
    super.key,
    this.onPressed,
    required this.sectionTitle,
    required this.textStyle,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sectionTitle,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF242424),
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(buttonText, style: textStyle),
        ),
      ],
    );
  }
}
