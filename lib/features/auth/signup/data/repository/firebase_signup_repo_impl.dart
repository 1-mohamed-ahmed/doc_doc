import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_doc/core/errors/firebase_error_handler.dart';
import 'package:doc_doc/core/networking/api_result.dart';
import 'package:doc_doc/core/networking/error_model.dart';
import 'package:doc_doc/features/auth/signup/data/dataSource/firebase_signup_service.dart';
import 'package:doc_doc/features/auth/signup/domain/signup_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseSignupRepoImpl implements FirebaseSignupRepo {
  final FirebaseSignupService _firebaseSignupService;

  FirebaseSignupRepoImpl({required this._firebaseSignupService});

  Future<ApiResult<UserCredential>> firebaseSignUp(
    String email,
    String password,
  ) async {
    try {
      final response = await _firebaseSignupService.signUp(email, password);
      return ApiResult.success(response);
    } on FirebaseException catch (e) {
      return ApiResult.failure(FirebaseErrorHandler.handle(e));
    } catch (e) {
      return ApiResult.failure(ErrorModel(message: e.toString()));
    }
  }
}
