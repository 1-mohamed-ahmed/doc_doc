import 'package:doc_doc/core/helpers/extention.dart';
import 'package:doc_doc/core/theming/app_text_style.dart';
import 'package:doc_doc/core/widgets/app_form_text_field.dart';
import 'package:doc_doc/features/home/logic/home_cubit.dart';
import 'package:doc_doc/features/home/logic/home_state.dart';
import 'package:doc_doc/features/home/presentation/widget/filter_doctors_by_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart' show CustomSnackBar;
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class DoctorsSpecialist extends StatefulWidget {
  final int specializationId;
  const DoctorsSpecialist({super.key, required this.specializationId});

  @override
  State<DoctorsSpecialist> createState() => _DoctorsSpecialistState();
}

class _DoctorsSpecialistState extends State<DoctorsSpecialist> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
   
    context.read<HomeCubit>().getFilterDoctors(
      widget.specializationId.toString(),
    );
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 129, 186, 232),
  scrolledUnderElevation: 0,
  elevation: 0,
        toolbarHeight: 80,
        title: Text("Doctor Speciality", style: TextStyles.font24blackW700),
        centerTitle: true,

        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 10,
                  children: [
                    Expanded(
                      child: AppFormTextField(
                        myContrller: searchController,
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        onChanged: (value) {
                          setState(() {

                          });
                        },
                      ),
                    ),

                    Icon(Icons.menu),
                  ],
                ),
                SizedBox(height: 20.h),

                BlocConsumer<HomeCubit, HomeState>(
                  listener: (context, state) {
                    if (state is DoctorsSpecializationByIdError) {
                      showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.error(message: state.message),
                      );
                    }
                  },

                  builder: (context, state) {
                    if (state is DoctorsSpecializationByIdLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is DoctorsSpecializationByIdLoaded) {
                      return FilterDoctorsById(
                        originDoctors: state.getDoctorsSpecializationById, 
                        controller:searchController.text
                      );
                    }else if(state is DoctorsSpecializationByIdError){
                      return Text("No data");
                    }else {
                      return SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
