import 'package:doc_doc/core/widgets/app_appBar.dart';
import 'package:flutter/material.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppbar(context, title: "personal Information"),
    body: Text("personal Information"),

    );
  }
}