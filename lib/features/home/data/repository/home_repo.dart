import 'package:doc_doc/core/networking/api_result.dart';
import 'package:doc_doc/features/home/data/model/all_doctors_model.dart';
import 'package:doc_doc/features/home/data/model/all_doctors_specialization.dart';
import 'package:doc_doc/features/home/data/model/home_doctors_model.dart';
import 'package:doc_doc/features/home/data/model/home_filter_doctors_model.dart';

abstract class HomeRepo {
  Future<ApiResult<HomeDoctorsModel>>
  getHomeDoctors(); //some doctors in home page
  Future<ApiResult<AllDoctorsModel>>
  getAllDoctors(); //all doctors in application
  Future<ApiResult<AllDoctorsSpecialization>>
  getAllSpecialization(); //all specializations in application
  Future<ApiResult<List<FilterDoctorsList>>> getDoctorSpecializationsById(
    String id,
  ); // get doctors by id
}
