import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowDialogIndecator<T> {
  static  showIndicator(BuildContext context) {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 250.w,
            height: 200.h,
            child: CupertinoAlertDialog(
              content: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: CupertinoActivityIndicator(
                  radius: 16,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
