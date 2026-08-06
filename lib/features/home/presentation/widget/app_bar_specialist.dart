import 'package:doc_doc/core/helpers/extention.dart';
import 'package:doc_doc/core/routing/routes.dart';
import 'package:doc_doc/core/theming/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarSpecialist extends StatelessWidget {
  const AppBarSpecialist({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 285.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.arrow_back_ios_new),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text("Doctor Speciality", style: TextStyles.font24blackW700),
          ),
        ],
      ),
    );
  }
}
