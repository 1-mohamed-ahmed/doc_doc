import 'package:doc_doc/core/helpers/extention.dart';
import 'package:doc_doc/core/routing/routes.dart';
import 'package:doc_doc/features/home/presentation/widget/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Message",style: TextStyle(
          fontSize: 22.sp
        ),),
        centerTitle: true,
        backgroundColor: const Color(0xFF438DDC),
      ),
      body: Center(child: Text("No data exist",style: TextStyle(fontSize: 22.sp),),),
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