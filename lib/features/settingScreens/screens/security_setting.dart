import 'package:doc_doc/core/helpers/extention.dart';
import 'package:doc_doc/core/widgets/app_appBar.dart';
import 'package:doc_doc/features/settingScreens/widgets/switch_list_tile_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecuritySetting extends StatefulWidget {
  const SecuritySetting({super.key});

  @override
  State<SecuritySetting> createState() => _SecuritySettingState();
}

class _SecuritySettingState extends State<SecuritySetting> {
  bool remmberPassword = true;
  bool faceId = true;
  bool pin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppbar(context, title: "Security"),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 15.h),
            notificationSettingBody(
              title: "Remmber Password",
              value: remmberPassword,
              onChange: (change) {
                setState(() {
                  remmberPassword = change;
                });
              },
            ),
            notificationSettingBody(
              title: "Fface ID",
              value: faceId,
              onChange: (change) {
                setState(() {
                  faceId = change;
                });
              },
            ),
            notificationSettingBody(
              title: "Pin",
              value: pin,
              onChange: (change) {
                setState(() {
                  pin = change;
                });
              },
            ),

            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Google Authenticator',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 18.r,
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
