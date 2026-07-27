import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    // نستخدم الـ Padding لإعطاء مسافة من اليمين واليسار حول الشكل كله
    return Row(
      children: [
        // 1. الخط الأيمن
        Expanded(
          child: Divider(
            color: Colors.grey, // لون الخط
            thickness: 1, // سُمك الخط
          ),
        ),

        // 2. الكلمة في المنتصف مع مسافات حولها
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            "OR SignUp with",
            style: TextStyle(
              color: Colors.grey, // لون الكلمة كما في الصورة
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),

        // 3. الخط الأيسر
        Expanded(
          child: Divider(
            color: Colors.grey, // نفس لون الخط الأيمن
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
