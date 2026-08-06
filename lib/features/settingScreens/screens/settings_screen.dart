import 'package:doc_doc/core/api/api_keys.dart';
import 'package:doc_doc/core/cache/cache_helper.dart';
import 'package:doc_doc/core/di/server_locator.dart';
import 'package:doc_doc/core/helpers/extention.dart';
import 'package:doc_doc/core/routing/routes.dart';
import 'package:doc_doc/core/widgets/app_appBar.dart';
import 'package:doc_doc/features/home/presentation/widget/alert_dialog_.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppbar(context ,title: "Settings"),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            SizedBox(height: 30.h),

            settingCategoryBody(
              iconImage: Icons.notifications_none_outlined,
              title: "Notification",
              onTap: () {
                context.pushNamed(Routes.notificationSetting);
              },
            ),

            settingCategoryBody(
              iconImage: Icons.quiz_outlined,
              title: "FAQ",
              onTap: () {},
            ),

            settingCategoryBody(
              iconImage: Icons.lock_outline,
              title: "Security",
              onTap: () {
                context.pushNamed(Routes.securitySetting);
              },
            ),

            settingCategoryBody(
              iconImage: Icons.language_outlined,
              title: "Language",
              onTap: () {
                context.pushNamed(Routes.language);
              },
            ),

            settingCategoryBody(
              titleColor: Colors.red,
              iconColor: Colors.red,
              iconImage: Icons.logout_outlined,
              title: "Logout",
              onTap: () async {
                showIosDialog(
                  context,
                  cancledOnPressed: () {
                    context.pop();
                  },
                  okOnPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    await getIt<CacheHelper>().removeData(key: ApiKeys.token);
                    // ignore: use_build_context_synchronously
                    context.pushNamedAndRemoveUntil(Routes.login);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget settingCategoryBody({
    void Function()? onTap,
    Color? iconColor,
    Color? titleColor,
    required IconData? iconImage,
    required String title,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 15.w,
                      children: [
                        Icon(
                          iconImage,
                          size: 22.r,
                          color: iconColor ?? Colors.black,
                        ),

                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color: titleColor ?? Colors.black,
                          ),
                        ),
                      ],
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Divider(color: Color(0xFFEDEDED)),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
