import 'package:doc_doc/core/networking/api_consuemr.dart';
import 'package:doc_doc/features/auth/data/datasource/login_request.dart';
import 'package:doc_doc/features/auth/data/repo/login_repo_impl.dart';
import 'package:doc_doc/features/auth/domain/login_repo.dart';
import 'package:doc_doc/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void initAuthLocator() {
  getIt.registerLazySingleton<LoginRequest>(
    () => LoginRequest(apiConsumer: getIt<ApiConsumer>()),
  );

  getIt.registerFactory<LoginRepo>(
    () => LoginRepoImpl(loginRequest: getIt<LoginRequest>()),
  );
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(loginRepo: getIt<LoginRepo>()),
  );
}
