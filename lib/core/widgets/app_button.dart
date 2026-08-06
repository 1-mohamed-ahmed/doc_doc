import 'package:doc_doc/core/theming/app_color.dart';
import 'package:doc_doc/core/theming/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final void Function()? onPressed;
  final String textButton;
  final bool isLoading;
  const AppButton({
    super.key,
    required this.textButton,
    this.onPressed,
    required this.isLoading,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      minimumSize: Size(300.w, 50.h),
      color: color ?? AppColor.buttonColor,
      foregroundColor: Colors.white,
      borderRadius: BorderRadius.circular(15.r),
      pressedOpacity: 0.8,

      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h),

      child: isLoading
          ? CircularProgressIndicator(color: Colors.white)
          : Text(
              textButton,
              style: TextStyles.font15grayW400.copyWith(
                color: textColor ?? Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                letterSpacing: 0.9,
              ),
            ),
    );
  }
}
