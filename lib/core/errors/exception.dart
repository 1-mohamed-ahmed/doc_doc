import 'package:doc_doc/core/networking/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;
  ServerException({required this.errorModel});
}
