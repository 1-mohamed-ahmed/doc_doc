import 'package:dio/dio.dart';
import 'package:doc_doc/core/api/api_constants.dart';
import 'package:doc_doc/features/home/data/model/all_doctors_model.dart';
import 'package:doc_doc/features/home/data/model/all_doctors_specialization.dart';
import 'package:doc_doc/features/home/data/model/home_doctors_model.dart';
import 'package:doc_doc/features/home/data/model/home_filter_doctors_model.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;
  // Get doctors in home page
  @GET(ApiConstants.getHomeDoctors)
  Future<HomeDoctorsModel> getHomeDoctors();

  // Get All Specialization
  @GET(ApiConstants.getAllSpecialization)
  Future<AllDoctorsSpecialization> getAllSpecialization();

  // Get all doctors in api
  @GET(ApiConstants.getAllDoctors)
  Future<AllDoctorsModel> getAllDoctors();

  // get doctors by id
  @GET("${ApiConstants.filterDoctorsById}{id}")
  Future<HomeFilterDoctorsModel> getDoctorSpecializationsById(
    @Path('id') String id,
  );
}
