import 'package:doc_doc/core/theming/app_color.dart';
import 'package:doc_doc/core/theming/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarNotification extends StatelessWidget {
  final void Function()? leftIconOnPressed;
  final void Function()? rightIconOnPressed;
  const AppBarNotification({
    super.key,
    this.leftIconOnPressed,
    this.rightIconOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          style: ElevatedButton.styleFrom(),
          onPressed: leftIconOnPressed,
          icon: Icon(Icons.arrow_back_ios_new, size: 20.w),
        ),
        Text("Notification", style: TextStyles.font22blackW600),
        TextButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.secondary,
            foregroundColor: Colors.white,
          ),
          onPressed: rightIconOnPressed,
          child: Text("new"),
        ),
      ],
    );
  }
}
