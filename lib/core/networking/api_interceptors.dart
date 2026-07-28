import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Accept"] = "application/json"; //header that api wants

    super.onRequest(options, handler);
  }
}
