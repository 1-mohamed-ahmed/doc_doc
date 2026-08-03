import 'package:doc_doc/core/api/api_keys.dart';
import 'package:doc_doc/core/cache/cache_helper.dart';
import 'package:doc_doc/core/di/server_locator.dart';
import 'package:doc_doc/core/helpers/extention.dart';
import 'package:doc_doc/core/routing/routes.dart';
import 'package:doc_doc/core/widgets/app_button.dart';
import 'package:doc_doc/features/home/presentation/widget/bottom_navigation_bar.dart';
import 'package:doc_doc/features/home/presentation/widget/doctor_banner.dart';
import 'package:doc_doc/features/home/presentation/widget/doctor_card_section.dart';
import 'package:doc_doc/features/home/presentation/widget/doctors_specialists_section.dart';
import 'package:doc_doc/features/home/presentation/widget/home_header.dart';
import 'package:doc_doc/features/home/presentation/widget/sections_header.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                // Header Section
                HomeHeader(
                  subTitle: "Hi, name",
                  title: "How Are You?",
                  // IconButton onPressed action
                  onPressed: () {
                    context.pushNamed(Routes.notification);
                  },
                ),

                // Doctor Banner Section
                DoctorBanner(onPressed: () {}),
                SizedBox(height: 20.h),
                // Doctors Specialists Section Header
                SectionsHeader(
                  buttonText: "See All",
                  sectionTitle: "Doctors Specialists",
                  textStyle: TextStyle(color: Colors.blue, fontSize: 15),
                  // TextButton onPressed action
                  onPressed: () {},
                ),
                SizedBox(height: 20.h),

                // Doctors Specialists Section
                DoctorsSpecialistsSection(
                  generalDoctorPressed: () {}, // first Specialist
                  neurologicDoctorPressed: () {}, // second Specialist
                  pediatricDoctorPressed: () {}, // third Specialist
                  radiologyDoctorPressed: () {}, // forth Specialist
                ),

                SizedBox(height: 20.h),
                // Recommendation Doctors Section Header
                SectionsHeader(
                  buttonText: "See All",
                  sectionTitle: "Recommendation Doctors",
                  textStyle: TextStyle(color: Colors.blue, fontSize: 15),

                  // TextButton onPressed action
                  onPressed: () {},
                ),

                SizedBox(height: 20.h),
                // Recommendation Doctors Section
                DoctorCardSection(),

                SizedBox(height: 20.h),
                AppButton(
                  textButton: "Log out",
                  isLoading: false,
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    await getIt<CacheHelper>().removeData(key: ApiKeys.token);
                    context.pushNamedAndRemoveUntil(Routes.login);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      // bottom navigation bar tarnslation
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: 1,
        onItemTapped: (value) {},
        onSearchTapped: () {},
      ),
    );
  }
}
