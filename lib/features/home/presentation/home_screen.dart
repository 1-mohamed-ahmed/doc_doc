import 'package:doc_doc/features/home/presentation/widget/doctor_banner.dart';
import 'package:doc_doc/features/home/presentation/widget/home_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                HomeHeader(
                  subTitle: "Hi, name",
                  title: "How Are You?",
                  onPressed: () {},
                ),
                DoctorBanner(onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
