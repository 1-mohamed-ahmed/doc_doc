import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderDropdown extends StatelessWidget {
  final int? value;
  final ValueChanged<int?> onChanged;

  const GenderDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      initialValue: value,
      decoration: InputDecoration(
        hintText: "Gender",
        fillColor: Colors.grey[200],
        filled: true,
        prefixIcon: Icon(Icons.person_outline),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
        ),
      ),
      items: const [
        DropdownMenuItem(value: 0, child: Text("Male")),
        DropdownMenuItem(value: 1, child: Text("Female")),
      ],

      onChanged: onChanged,
      validator: (value) {
        if (value == null) {
          return "Please select your gender";
        }
        return null;
      },
    );
  }
}
