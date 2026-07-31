import 'package:doc_doc/core/theming/app_images.dart';
import 'package:doc_doc/core/theming/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorBanner extends StatelessWidget {
  final void Function()? onPressed;
  const DoctorBanner({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const cardHeight = 167.0;

        return SizedBox(
          height: cardHeight + 40,
          width: constraints.maxWidth,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // --- 1. البطاقة الزرقاء الخلفية ---
              Positioned(
                bottom: 0, // بنخليها تثبت في أسفل الـ Stack
                left: 0,
                right: 0,
                height: cardHeight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    // لإضافة تأثير الخطوط المائلة في الخلفية (اختياري)
                  ),
                  child: SvgPicture.asset(AppImages.banner, fit: BoxFit.cover),
                ),
              ),

              // --- 2. المحتوى النصي والزرار (Column) ---
              Positioned(
                top: 60, // نضبط المسافة من فوق
                left: 20, // نضبط المسافة من الشمال
                width:
                    constraints.maxWidth *
                    0.55, // نحدد عرض العمود عشان النص ما يدخلش في الصورة
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Book and\nschedule with\nnearest doctor',
                      style: TextStyles.font24blackW700.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // الزرار الأبيض
                    ElevatedButton(
                      onPressed: onPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(
                          0xFF247CFF,
                        ), // لون النص جوه الزرار
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 17,
                        ),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Text(
                        'Find Nearby',
                        style: TextStyles.font13blueW700,
                      ),
                    ),
                  ],
                ),
              ),

              // --- 3. صورة الطبيبة (بروز للخارج) ---
              Positioned(
                right: 5, // نثبتها على اليمين
                bottom: 0, // نثبتها من الأسفل عشان تبدأ من نفس خط البطاقة
                height:
                    cardHeight +
                    35, // 💡 الطول الكلي للصورة أكبر من طول البطاقة عشان تبرز فوق
                child: SvgPicture.asset(AppImages.nurse, fit: BoxFit.contain),
              ),
            ],
          ),
        );
      },
    );
  }
}
