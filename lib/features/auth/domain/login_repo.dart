import 'package:doc_doc/features/auth/data/model/login_model.dart';

abstract class LoginRepo {
  Future<LoginModel> login(String email, String password);
}
