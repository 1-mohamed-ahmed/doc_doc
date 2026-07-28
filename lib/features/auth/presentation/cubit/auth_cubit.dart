import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:doc_doc/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitialAuthState());

  signin(String emailSignIn, String passwordSignIn) async {
    emit(AuthStateLoading());
    try {
      final response = await Dio().post(
        "https://vcare.integration25.com/api/auth/login",
        data: {"email": emailSignIn, "password": passwordSignIn},
      );
      emit(AuthStateSuccess(response));
      print("================================");
      print(response);
      print("================================");
      return response;
    } catch (e) {
      print("================================");

      print(e.toString());
      print("================================");

      emit(AuthStateFailure(e.toString()));
    }
  }
}
