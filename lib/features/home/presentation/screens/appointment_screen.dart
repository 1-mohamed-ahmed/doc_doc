import 'package:doc_doc/core/helpers/extention.dart';
import 'package:doc_doc/core/routing/routes.dart';
import 'package:doc_doc/features/home/presentation/widget/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {

  int selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointment"),
        centerTitle: true,
        backgroundColor: const Color(0xFF438DDC),
      ),
      body: Center(child: Text("Not found",style: TextStyle(fontSize: 22.sp),),),



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