import 'package:doc_doc/core/errors/dio_error_handling.dart';
import 'package:doc_doc/core/errors/firebase_error_handler.dart';
import 'package:doc_doc/core/networking/error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_result.freezed.dart';

@Freezed()
abstract class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(ErrorModel message) = Failure<T>;
}
