import 'package:dio/dio.dart';
import 'package:doc_doc/core/errors/dio_error_handling.dart';
import 'package:doc_doc/core/networking/api_result.dart';
import 'package:doc_doc/core/networking/error_model.dart';
import 'package:doc_doc/features/home/data/apiService/home_api_service.dart';
import 'package:doc_doc/features/home/data/model/home_response_body.dart';
import 'package:doc_doc/features/home/data/repository/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeApiService _homeApiService;
  const HomeRepoImpl({required this._homeApiService});

  @override
  Future<ApiResult<HomeResponseBody>> getAllDoctors() async {
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
}
