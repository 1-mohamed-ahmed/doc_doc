import 'package:doc_doc/core/theming/app_images.dart';
import 'package:doc_doc/features/home/data/model/all_doctors_specialization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsSpecialistsSection extends StatelessWidget {
  final void Function(int)? onPressed;
  final List<SpecializationsOfData>? specialization;

  const DoctorsSpecialistsSection({
    super.key,
    required this.specialization,
    this.onPressed,
  });

  String isImageOrNo(String? specialization) {
    switch (specialization) {
      case "Urology":
        return AppImages.brain;
      case "Psychiatry":
        return AppImages.general;
      case "Pediatrics":
        return AppImages.baby;
      case "Cardiology":
        return AppImages.cardiologist;
      case "Neurology":
        return AppImages.kidneys;
      default:
        return AppImages.ent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specialization!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: specialistIcon(
              imagesPath: isImageOrNo(
                specialization![index].specializationName,
              ),
              title: specialization![index].specializationName!,
    
              onPressed: () {
                onPressed?.call(specialization![index].id!);
              },
            ),
          );
        },
      ),
    );
  }

  Widget specialistIcon({
    required String imagesPath,
    required String title,
    VoidCallback? onPressed,
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
