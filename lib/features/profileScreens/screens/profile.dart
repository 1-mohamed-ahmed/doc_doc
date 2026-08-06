import 'package:doc_doc/core/helpers/extention.dart';
import 'package:doc_doc/core/routing/routes.dart';
import 'package:doc_doc/features/home/presentation/widget/bottom_navigation_bar.dart';
import 'package:doc_doc/features/home/presentation/widget/icon_profile.dart';
import 'package:doc_doc/features/home/presentation/widget/profile_body.dart';
import 'package:doc_doc/features/home/presentation/widget/profile_top_bar.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    const double topBarHeight = 180;
    const double avatarRadius = 55;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
         const ProfileBody(),

          ProfileTopBar(onPressed: () {
            context.pushNamed(Routes.settingScreen);

          }),

         const Positioned(top: topBarHeight - avatarRadius, child:  IconProfile()),
        ],
      ),

      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selectedIndex,
        onItemTapped: (value) {
          setState(() {
            selectedIndex = value;
          });
          switch (value) {
            case 0:
              context.pushNamedAndRemoveUntil(Routes.homeScreen);
            case 1:
              context.pushNamedAndRemoveUntil(Routes.message);
            case 2:
              context.pushNamedAndRemoveUntil(Routes.apointment);
            case 3:
              context.pushNamedAndRemoveUntil(Routes.profile);
          }
        },
        onSearchTapped: () {
          context.pushNamed(Routes.search);
        },
      ),
    );
  }

}
