import 'package:doc_doc/core/theming/app_images.dart';
import 'package:doc_doc/features/home/logic/home_cubit.dart';
import 'package:doc_doc/features/home/logic/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsSpecialistsSection extends StatelessWidget {
  final void Function()? generalDoctorPressed; //General icon onPressed
  final void Function()? neurologicDoctorPressed; //Neurologic icon onPressed
  final void Function()? pediatricDoctorPressed; //Pediatric icon onPressed
  final void Function()? radiologyDoctorPressed; //Radiology icon onPressed
  const DoctorsSpecialistsSection({
    super.key,
    this.generalDoctorPressed,
    this.neurologicDoctorPressed,
    this.pediatricDoctorPressed,
    this.radiologyDoctorPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            specialistIcon(
              AppImages.general,
              "General",
              onPressed: generalDoctorPressed,
            ),
            specialistIcon(
              AppImages.brain,
              "Neurologic",
              onPressed: neurologicDoctorPressed,
            ),
            specialistIcon(
              AppImages.baby,
              "Pediatric",
              onPressed: pediatricDoctorPressed,
            ),
            specialistIcon(
              AppImages.kidneys,
              "Radiology",
              onPressed: radiologyDoctorPressed,
            ),
          ],
        );
      },
    );
  }

  Widget specialistIcon(
    String imagesPath,
    String title, {
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
