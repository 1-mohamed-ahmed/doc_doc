import 'package:doc_doc/core/helpers/extention.dart';
import 'package:doc_doc/core/theming/app_text_style.dart';
import 'package:doc_doc/features/home/presentation/widget/app_bar_notification.dart';
import 'package:doc_doc/features/home/presentation/widget/sections_header.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // AppBar notification Screen
                AppBarNotification(
                  leftIconOnPressed: () {context.pop();},
                  rightIconOnPressed: () {},
                ),

                SectionsHeader(
                  buttonText: "Mark all as read",
                  sectionTitle: "Today",
                  textStyle: TextStyles.font15grayW400,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
