import 'package:bloc/bloc.dart';
import 'package:doc_doc/core/errors/exception.dart';
import 'package:doc_doc/features/auth/domain/login_repo.dart';
import 'package:doc_doc/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  LoginRepo loginRepo;
  AuthCubit({required this.loginRepo}) : super(InitialAuthState());

  Future<void> login(String email, String password) async {
    try {
      emit(AuthStateLoading());
      final response = await loginRepo.login(email, password);
      emit(AuthStateSuccess(response));
    } on ServerException catch (e) {
      emit(AuthStateFailure(e.errorModel.message));
    } catch (e) {
      emit(AuthStateFailure(e.toString()));
    }
  }
}
