import 'package:doc_doc/core/theming/app_color.dart';
import 'package:doc_doc/core/theming/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginHeader extends StatelessWidget {
  final String headerText;
  final String description;
  const LoginHeader({
    super.key,
    required this.headerText,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            headerText,
            textAlign: TextAlign.left,
            style: TextStyles.fontSize24blackW700.copyWith(
              color: AppColor.secondary,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Text(description, style: TextStyles.fontSize12grayW400),
      ],
    );
  }
}
