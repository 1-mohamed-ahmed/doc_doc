import 'package:doc_doc/core/helpers/extention.dart';
import 'package:doc_doc/core/widgets/app_appBar.dart';
import 'package:doc_doc/features/settingScreens/widgets/switch_list_tile_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool notifivationValue = true;
  bool soundValue = true;
  bool vibrateValue = false;
  bool updatesValue = true;
  bool offersValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppbar(context, title: "Notification"),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            notificationSettingBody(
              title: "Notification from DocNow",
              value: notifivationValue,
              onChange: (change) {
                setState(() {
                  notifivationValue = change;
                });
              },
            ),
            notificationSettingBody(
              title: "Sound",
              value: soundValue,
              onChange: (change) {
                setState(() {
                  soundValue = change;
                });
              },
            ),
            notificationSettingBody(
              title: "Vibrate",
              value: vibrateValue,
              onChange: (change) {
                setState(() {
                  vibrateValue = change;
                });
              },
            ),
            notificationSettingBody(
              title: "App Updates",
              value: updatesValue,
              onChange: (change) {
                setState(() {
                  updatesValue = change;
                });
              },
            ),
            notificationSettingBody(
              title: "Pecial offers",
              value: offersValue,
              onChange: (change) {
                setState(() {
                  offersValue = change;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

 
}
