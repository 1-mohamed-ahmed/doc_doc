import 'package:doc_doc/core/networking/api_result.dart';
import 'package:doc_doc/features/home/data/model/home_response_body.dart';

abstract class HomeRepo {
  Future<ApiResult<HomeResponseBody>> getAllDoctors();
}
