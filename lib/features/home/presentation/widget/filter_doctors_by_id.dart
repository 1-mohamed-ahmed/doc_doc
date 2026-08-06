import 'package:doc_doc/core/theming/app_images.dart';
import 'package:doc_doc/core/theming/app_text_style.dart';
import 'package:doc_doc/features/home/data/model/home_filter_doctors_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class FilterDoctorsById extends StatefulWidget {
  final List<FilterDoctorsList>? originDoctors;
  
  String? controller ;
  FilterDoctorsById({super.key, this.originDoctors ,required this.controller});

  @override
  State<FilterDoctorsById> createState() => _FilterDoctorsByIdState();
}

class _FilterDoctorsByIdState extends State<FilterDoctorsById> {

List<FilterDoctorsList>? filterDoctors = [];

  @override
  void initState() {
    super.initState();
    filterDoctors = widget.originDoctors;
  }


  @override
  void didUpdateWidget(covariant FilterDoctorsById oldWidget) {
  super.didUpdateWidget(oldWidget);

  if (oldWidget.controller != widget.controller) {
    filterSearch(query: widget.controller ?? "");
  }
}



  void filterSearch({String query =""}) {
    setState(() {
      if (query.isEmpty) {
        filterDoctors = widget.originDoctors;
      } else {
        filterDoctors = widget.originDoctors!
            .where(
              (doctor) =>
                  doctor.name!.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }






  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: filterDoctors?.length ?? 0  ,
      itemBuilder: (context, index) {
        final doctor = filterDoctors![index];
        return Card(
          margin: EdgeInsets.only(top: 10 , bottom: 10),
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: FadeInImage(
                      placeholder: AssetImage(AppImages.doctorAvatar),
                      image: NetworkImage(doctor.imageUrl),
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(AppImages.doctorAvatar);
                      },
                    ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${doctor.name}",
                          style: TextStyles.font18blackW700,
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${doctor.specialization!["name"]}",
                          style: TextStyle(fontSize: 16.sp, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
