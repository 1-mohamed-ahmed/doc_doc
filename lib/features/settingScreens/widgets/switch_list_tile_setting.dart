 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget notificationSettingBody({
    required bool value,
    required String title,
    void Function(bool)? onChange,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8),
          child: Column(
            children: [
              SwitchListTile(
                title: Text(title),

                value: value,
                onChanged: onChange,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Divider(color: Color(0xFFEDEDED)),
        ),
        SizedBox(height: 5.h),
      ],
    );
  }