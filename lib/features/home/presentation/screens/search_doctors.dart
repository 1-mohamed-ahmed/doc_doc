import 'package:doc_doc/core/helpers/extention.dart';
import 'package:doc_doc/core/theming/app_text_style.dart';
import 'package:doc_doc/core/widgets/app_form_text_field.dart';
import 'package:doc_doc/features/home/logic/home_cubit.dart';
import 'package:doc_doc/features/home/logic/home_state.dart';
import 'package:doc_doc/features/home/presentation/widget/all_doctors_list_veiw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController searchController = TextEditingController();


@override
void initState() {
  super.initState();
  context.read<HomeCubit>().getAllDoctors();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: Text(
          "Find Nearby",
          style: TextStyles.font18blackW700.copyWith(fontSize: 20.sp),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
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
          
              BlocBuilder<HomeCubit ,HomeState>(builder:(context , state){
                if (state is AllDoctorsLoading){
                  return Center(child: CircularProgressIndicator(),);
                }else if(state is AllDoctorsError){
                  return Text(state.message);
                }else if(state is AllDoctorsLoaded){
                  
                  return Expanded(child: AllDoctorsListVeiw(allDoctorsModel: state.allDoctors ,query: searchController.text)); 
                }else{
                  return SizedBox();
                }
              })
          
            ],
          ),
        ),
      ),
    );
  }
}
