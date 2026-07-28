import 'package:doc_doc/features/auth/data/datasource/login_request.dart';
import 'package:doc_doc/features/auth/data/model/login_model.dart';
import 'package:doc_doc/features/auth/domain/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final LoginRequest loginRequest;
  LoginRepoImpl({required this.loginRequest});

  @override
  Future<LoginModel> login(String email, String password) async {
    final response = await loginRequest.login(email, password);
    return LoginModel.fromJson(response as Map<String, dynamic>);
  }
}
