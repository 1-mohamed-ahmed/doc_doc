import 'package:flutter/cupertino.dart';

void showIosDialog(BuildContext context ,{void Function()? cancledOnPressed , void Function()? okOnPressed }) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text('Logout'),
        content: const Text("The less text people have to read onscreen, the better."),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDestructiveAction: true, 
            onPressed: cancledOnPressed,
            child: const Text('cansle'),
          ),
          CupertinoDialogAction(
            isDefaultAction: true, 
            onPressed:okOnPressed,
            child: const Text('Logout'),
          ),
        ],
      );
    },
  );
}