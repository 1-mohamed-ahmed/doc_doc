import 'package:doc_doc/core/helpers/extention.dart';
import 'package:doc_doc/core/routing/routes.dart';
import 'package:doc_doc/core/theming/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  double topBarHeight = 180;
  double avatarRadius = 55;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: topBarHeight - avatarRadius),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 130.h),

            const Text(
              'Omar Ahmed',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 4.h),
            const Text(
              'omarahmed14@gmail.com',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            Container(
              width: 360.w,
              decoration: BoxDecoration(
                color: Color(0xFFf8f8f8),
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  containerProfile(
                    "My Appointment",
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(25.r),
                    ),
                    onTap: () {},
                  ),
                  verticalDivider(),

                  containerProfile(
                    "My Appointment",
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(25.r),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),

            SizedBox(height: 40.h),

            profileCategoryBody(
              iconImage: Image.asset(
                AppImages.personalCard,
                width: 24.w,
                height: 24.h,
              ),
              title: "Personal information",
              iconBackgroundColor: Color(0xFFEAF2FF),
              onTap: (){
                context.pushNamed(Routes.personalInformation);
              }
            ),

            profileCategoryBody(
              iconImage: null,
              title: "Payment",
              iconBackgroundColor: Color(0xFFE9FAEF),
            ),

            profileCategoryBody(
              iconImage: Image.asset(
                AppImages.wallet,
                width: 24.w,
                height: 24.h,
              ),
              title: "Payment",
              iconBackgroundColor: Color(0xFFFFEEEF),
            ),
          ],
        ),
      ),
    );
  }

  Widget containerProfile(
    String title, {
    required BorderRadiusGeometry borderRadius,
    void Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 150.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: const Color(0xFFf8f8f8),
          borderRadius: borderRadius,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Color(0xFF242424),
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget verticalDivider() {
    return SizedBox(
      height: 50,
      child: VerticalDivider(
        color: const Color(0xFFE0E0E0),
        thickness: 3.w,
        width: 2.w,
        indent: 1.h,
        endIndent: 1.h,
      ),
    );
  }

  Widget profileCategoryBody({
    void Function()? onTap,
    Color? iconBackgroundColor,
    required Image? iconImage,
    required String title,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0 , vertical: 3),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 30.w,
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: iconBackgroundColor ?? Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: Align(
                    // alignment: Alignment.,
                    child: iconImage ?? SvgPicture.asset(AppImages.myTest),
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Divider(color: Color(0xFFEDEDED)),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
