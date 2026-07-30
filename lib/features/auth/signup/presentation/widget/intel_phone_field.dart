import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class IntelPhoneField extends StatelessWidget {
  final TextEditingController? controller;
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  final String? errorText;
  const IntelPhoneField({
    super.key,
    this.controller,
    this.validator,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        errorText: errorText,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 17.h),
        hintText: 'Your Number',
        fillColor: Colors.grey[200],
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
        ),
      ),
      initialCountryCode: 'EG',
      validator: validator,
      controller: controller,
    );
  }
}
