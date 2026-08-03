import 'package:doc_doc/core/errors/firebase_error_handler.dart';
import 'package:doc_doc/core/networking/api_result.dart';
import 'package:doc_doc/core/networking/error_model.dart';
import 'package:doc_doc/features/auth/login/data/apiService/firebase_login_service.dart';
import 'package:doc_doc/features/auth/login/domain/login_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseLoginRepoImpl implements FirebaseLoginRepo {
  final FirebaseLoginService _firebaseLoginService;
  FirebaseLoginRepoImpl({required this._firebaseLoginService});
  @override
  Future<ApiResult<UserCredential>> firebaseLogin(
    String email,
    String password,
  ) async {
    try {
      final response = await _firebaseLoginService.login(email, password);
      return ApiResult.success(response);
    } on FirebaseException catch (e) {
      return ApiResult.failure(FirebaseErrorHandler.handle(e));
    } catch (e) {
      return ApiResult.failure(ErrorModel(message: e.toString()));
    }
  }
}
