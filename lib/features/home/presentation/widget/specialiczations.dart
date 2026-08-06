import 'package:doc_doc/core/theming/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Specialiczations extends StatelessWidget {
  final void Function(int index)? onPressed;
  Specialiczations({super.key, this.onPressed});

  final List<String> icons = [
    AppImages.baby,
    AppImages.brain,
    AppImages.kidneys,
    AppImages.general,
    AppImages.cardiologist,
    AppImages.dentistry,
    AppImages.ent,
    AppImages.hepatology,
    AppImages.histologist,
    AppImages.intestine,
    AppImages.optometry,
    AppImages.pulmonary,
  ];
  final List<String> iconsName = [
    "Pediatric",
    "Urologist",
    "Neurologic",
    "General",
    "cardiologist",
    "Dentitry",
    "ENT",
    "Hepatology",
    "Histologist",
    "Intestine",
    "Optometry",
    "Pulmonary",
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: icons.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) {
        return specialistIcon(
          imagesPath: icons[index],
          title: iconsName[index],
          onPressed: () => onPressed?.call(index),
        );
      },
    );
  }

  Widget specialistIcon({
    required String imagesPath,
    required String title,
    void Function()? onPressed,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onPressed,
          child: CircleAvatar(
            radius: 30.w,
            backgroundColor: Color(0xFFf4f8ff),
            child: Center(
              child: Image.asset(imagesPath, width: 30.w, height: 30.h),
            ),
          ),
        ),

        SizedBox(height: 10.h),
        Text(
          title,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
