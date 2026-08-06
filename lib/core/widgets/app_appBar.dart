import 'package:doc_doc/core/helpers/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class AppAppbar extends StatelessWidget {
//   const AppAppbar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:
//     );
//   }
// }



PreferredSizeWidget appAppbar(BuildContext context ,{required String title}){
  return  AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ),
      );
}