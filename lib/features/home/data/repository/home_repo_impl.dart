import 'package:dio/dio.dart';
import 'package:doc_doc/core/errors/dio_error_handling.dart';
import 'package:doc_doc/core/networking/api_result.dart';
import 'package:doc_doc/core/networking/error_model.dart';
import 'package:doc_doc/features/home/data/apiService/home_api_service.dart';
import 'package:doc_doc/features/home/data/model/all_doctors_model.dart';
import 'package:doc_doc/features/home/data/model/all_doctors_specialization.dart';
import 'package:doc_doc/features/home/data/model/home_doctors_model.dart';
import 'package:doc_doc/features/home/data/model/home_filter_doctors_model.dart';
import 'package:doc_doc/features/home/data/repository/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeApiService _homeApiService;

  const HomeRepoImpl({required this._homeApiService});

  // this function fetch the doctors in home page from api service
  @override
  Future<ApiResult<HomeDoctorsModel>> getHomeDoctors() async {
    try {
      final response = await _homeApiService.getHomeDoctors();
      return ApiResult.success(response);
    } on DioException catch (e) {
      final errormodel = ErrorHandler.handle(e);

      return ApiResult.failure(errormodel.apiErrorModel);
    } catch (e) {
      return ApiResult.failure(ErrorModel(message: e.toString()));
    }
  }

  // this function fetch all doctors from api service

  @override
  Future<ApiResult<AllDoctorsModel>> getAllDoctors() async {
    try {
      final response = await _homeApiService.getAllDoctors();

      return ApiResult.success(response);
    } on DioException catch (e) {
      final errorHandle = ErrorHandler.handle(e);

      return ApiResult.failure(errorHandle.apiErrorModel);
    } catch (error) {
      return ApiResult.failure(ErrorModel(message: error.toString()));
    }
  }

  @override
  Future<ApiResult<AllDoctorsSpecialization>> getAllSpecialization() async {
    try {
      final response = await _homeApiService.getAllSpecialization();

      return ApiResult.success(response);
    } on DioException catch (e) {
      final errorHandle = ErrorHandler.handle(e);

      return ApiResult.failure(errorHandle.apiErrorModel);
    } catch (error) {
      return ApiResult.failure(ErrorModel(message: error.toString()));
    }
  }

  @override
  Future<ApiResult<List<FilterDoctorsList>>> getDoctorSpecializationsById(
    String id,
  ) async {
    try {
      final response = await _homeApiService.getDoctorSpecializationsById(id);
      final doctorsList = response.specialists!.doctors;
      return ApiResult.success(doctorsList!);
    } on DioException catch (e) {
      final errormodel = ErrorHandler.handle(e);
      return ApiResult.failure(errormodel.apiErrorModel);
    } catch (e) {
      return ApiResult.failure(ErrorModel(message: e.toString()));
    }
  }
}
