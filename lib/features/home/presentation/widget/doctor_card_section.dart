import 'package:doc_doc/features/home/logic/home_cubit.dart';
import 'package:doc_doc/features/home/logic/home_state.dart';
import 'package:doc_doc/features/home/presentation/widget/list_view_doctors_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorCardSection extends StatefulWidget {
  const DoctorCardSection({super.key});

  @override
  State<DoctorCardSection> createState() => _DoctorCardSectionState();
}

class _DoctorCardSectionState extends State<DoctorCardSection> {
  @override
  void initState() {
    context.read<HomeCubit>().getAllDoctors();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (BuildContext context, HomeState state) {
          if (state is HomeLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is HomeLoaded) {
            final doctors = state.doctors;
            return ListViewDoctorsCard(doctors: doctors);
          } else if (state is HomeError) {
            return Text(state.message);
          } else {
            return SizedBox(child: Text("No data"));
          }
        },
      ),
    );
  }
}
