import 'package:doc_doc/core/theming/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorBanner extends StatelessWidget {
  final void Function()? onPressed;
  const DoctorBanner({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 230.h,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            height: 190.h,
            width: 340.w,
            child: ClipRRect(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(40),
                right: Radius.circular(40),
              ),
              child: Stack(
                children: [
                  SizedBox(
                    height: 250.h,
                    child: SvgPicture.asset(
                      AppImages.banner,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 30.h,
                    left: 20.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Book and\nschedule with\nnearest doctor',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16.h),
                      ],
                    ),
                  ),
                  doctorBannerButton(
                    buttonTitle: 'Find Nearby',
                    onPressed: onPressed,
                  ),
                ],
              ),
            ),
          ),

          doctorBannerImage(AppImages.nurse),
        ],
      ),
    );
  }

  Widget doctorBannerImage(String pathImage) {
    return Positioned(
      bottom: 0,
      right: 0,
      height: 250.h,
      child: SizedBox(
        width: 200.w,
        height: 200.h,
        child: Image.asset(pathImage, fit: BoxFit.cover),
      ),
    );
  }

  Widget doctorBannerButton({
    required String buttonTitle,
    void Function()? onPressed,
  }) {
    return Positioned(
      bottom: 15,
      left: 20,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF247CFF),
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 17.h),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(
          buttonTitle,
          style: TextStyle(
            fontSize: 13.sp,
            color: const Color(0xFF247CFF),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
