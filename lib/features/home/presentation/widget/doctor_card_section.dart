
import 'package:doc_doc/features/home/data/model/home_doctors_model.dart';
import 'package:doc_doc/features/home/presentation/widget/list_view_doctors_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorCardSection extends StatelessWidget {

  final HomeDoctorsModel? doctors;
  const DoctorCardSection({super.key ,required this.doctors});

  @override
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListViewDoctorsCard(doctors: doctors) ,
    );
  }
}
