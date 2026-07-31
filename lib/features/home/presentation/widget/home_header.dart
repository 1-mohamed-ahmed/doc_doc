import 'package:doc_doc/core/theming/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  final String subTitle;
  final String title;

  final void Function()? onPressed;
  const HomeHeader({
    super.key,
    this.onPressed,
    required this.subTitle,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 150.w,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                  style: TextStyles.font24blackW700,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                subTitle,
                textAlign: TextAlign.left,
                style: TextStyles.font15grayW400,
              ),
            ],
          ),
        ),

        IconButton(
          color: Colors.black,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[200]),
          onPressed: onPressed,
          icon: Icon(Icons.notifications, size: 32),
        ),
      ],
    );
  }
}
