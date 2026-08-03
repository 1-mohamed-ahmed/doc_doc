import 'package:doc_doc/core/theming/app_images.dart';
import 'package:doc_doc/features/home/data/model/home_response_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewDoctorsCard extends StatelessWidget {
  final List<DoctorsList> doctors;
  const ListViewDoctorsCard({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (context, index) {
        final doctor = doctors[index];
        return SizedBox(
          height: 200.h,
          width: 3000.w,
          child: Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 10.h),
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
                doctorDiscription(
                  doctor.name!,
                  doctor.specialization!["name"],
                  doctor.email!,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget doctorDiscription(
    String doctorName,
    String doctorSpecialization,
    String doctorEmail,
  ) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Text(
              "Dr.$doctorName",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xFF242424),
                height: 1.5,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("$doctorSpecialization"),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("$doctorEmail "),
            ),
          ],
        ),
      ),
    );
  }
}
