import 'package:doc_doc/core/api/api_constants.dart';
import 'package:doc_doc/core/api/api_keys.dart';
import 'package:doc_doc/core/networking/api_consuemr.dart';
import 'package:doc_doc/features/auth/data/model/login_model.dart';

class LoginRequest {
  final ApiConsumer apiConsumer;
  LoginRequest({required this.apiConsumer});

  Future<LoginModel> login(String email, String password) async {
    final response = await apiConsumer.post(
      ApiConstants.login,
      data: {ApiKeys.email: email, ApiKeys.password: password},
    );
    return response;
  }
}
