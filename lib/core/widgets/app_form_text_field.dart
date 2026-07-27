import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AppFormTextField extends StatelessWidget {
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final TextEditingController? myContrller;
  final bool? obscureText;
  final String hintText;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final String Function(String?)? validator;

  const AppFormTextField({
    super.key,
    this.obscureText,
    this.myContrller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.focusedBorder,
    this.focusedErrorBorder,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myContrller,
      validator: validator,

      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        // isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 17.h),
        hintText: hintText,
        fillColor: Colors.grey[200],
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefixIconColor: Colors.grey,
        suffixIconColor: Colors.grey,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
        ),

        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 1.w),
              borderRadius: BorderRadius.all(Radius.circular(15.r)),
            ),

        focusedErrorBorder:
            focusedErrorBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.w),
              borderRadius: BorderRadius.all(Radius.circular(15.r)),
            ),
      ),
    );
  }
}
