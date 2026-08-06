import 'package:doc_doc/core/api/api_keys.dart';
import 'package:doc_doc/core/cache/cache_helper.dart';
import 'package:doc_doc/core/di/server_locator.dart';
import 'package:doc_doc/core/helpers/extention.dart';
import 'package:doc_doc/core/routing/routes.dart';
import 'package:doc_doc/core/theming/app_color.dart';
import 'package:doc_doc/core/theming/app_lang.dart';
import 'package:doc_doc/core/widgets/app_button.dart';
import 'package:doc_doc/features/home/data/model/home_doctors_model.dart';
import 'package:doc_doc/features/home/logic/home_cubit.dart';
import 'package:doc_doc/features/home/logic/home_state.dart';
import 'package:doc_doc/features/home/presentation/screens/doctors_categories.dart';
import 'package:doc_doc/features/home/presentation/widget/bottom_navigation_bar.dart';
import 'package:doc_doc/features/home/presentation/widget/doctor_banner.dart';
import 'package:doc_doc/features/home/presentation/widget/doctor_card_section.dart';
import 'package:doc_doc/features/home/presentation/widget/doctors_specialists_section.dart';
import 'package:doc_doc/features/home/presentation/widget/home_header.dart';
import 'package:doc_doc/features/home/presentation/widget/sections_header.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  HomeDoctorsModel? homeDoctors;

  @override
  void initState() {
    super.initState();

    getIt<CacheHelper>().setData(key: AppLang.lang, value: AppLang.english);
    final homeCubit = context.read<HomeCubit>();
    homeCubit.getAllSpecialziation();
    homeCubit.getHomeDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body: 
      SafeArea(
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
                DoctorBanner(
                  onPressed: () {
                    context.pushNamed(Routes.search);
                  },
                ),
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
                BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) =>
                      current is AllSpecializationLoading ||
                      current is AllSpecializationLoaded ||
                      current is AllSpecializationError,

                  builder: (context, state) {
                    if (state is AllSpecializationLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is AllSpecializationError) {
                      return Text(state.message);
                    } else if (state is AllSpecializationLoaded) {
                      return DoctorsSpecialistsSection(
                        onPressed: (index) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => BlocProvider(
                                create: (context) => getIt<HomeCubit>(),
                                child: DoctorsSpecialist(
                                  specializationId: index,
                                ),
                              ),
                            ),
                          );
                        },
                        specialization:
                            state.allSpecialization!.specializationsData,
                      );
                    } else {
                      return ElevatedButton(
                        
                        style: ElevatedButton.styleFrom(
                          backgroundColor:AppColor.buttonColor,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () async{
                        context.read<HomeCubit>().getHomeDoctors();
                      }, child: Text("Refresh"));
                    }
                  },
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
                BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) =>
                      current is HomeDoctorsLoading ||
                      current is HomeDoctorsError ||
                      current is HomeDoctorsLoaded,

                  builder: (context, state) {
                    if (state is HomeDoctorsLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is HomeDoctorsError) {
                      return Text(state.message);
                    } else if (state is HomeDoctorsLoaded) {
                      homeDoctors = state.homedoctors;
                      return DoctorCardSection(doctors: homeDoctors);
                    } else {
                      return ElevatedButton(
                        
                        style: ElevatedButton.styleFrom(
                          backgroundColor:AppColor.buttonColor,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () async{
                        context.read<HomeCubit>().getHomeDoctors();
                      }, child: Text("Refresh"));
                    }
                  },
                ),

                
              ],
            ),
          ),
        ),
      ),
      // bottom navigation bar tarnslation
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: selectedIndex,
        onItemTapped: (value) {
          setState(() {
            selectedIndex = value;
          });
          switch(value){
            case 0 :
              context.pushNamedAndRemoveUntil(Routes.homeScreen);
            case 1 : 
              context.pushNamedAndRemoveUntil(Routes.message);
            case 2 :
              context.pushNamedAndRemoveUntil(Routes.apointment);
            case 3 :
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
