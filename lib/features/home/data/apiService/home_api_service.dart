import 'package:dio/dio.dart';
import 'package:doc_doc/core/api/api_constants.dart';
import 'package:doc_doc/features/home/data/model/home_response_body.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(ApiConstants.getAllDoctors)
  Future<HomeResponseBody> getAllDoctors();
}
