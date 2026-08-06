import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTopBar extends StatelessWidget {
  final void Function()? onPressed;
  const ProfileTopBar({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 180.h,
            width: double.infinity,
            color: const Color(0xFF247CFF), 
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 48.w,),
                     Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.settings_outlined, color: Colors.white, ),
                      onPressed:onPressed,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}