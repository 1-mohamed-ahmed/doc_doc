import 'package:bloc/bloc.dart';
import 'package:doc_doc/core/networking/api_result.dart';
import 'package:doc_doc/features/home/data/model/home_response_body.dart';
import 'package:doc_doc/features/home/data/repository/home_repo.dart';
import 'package:doc_doc/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeInitial());

  Future<void> getAllDoctors() async {
    emit(HomeLoading());

    final response = await _homeRepo.getAllDoctors();

    response.when(
      success: (homeResponseBody) {
        final allDoctors =
            homeResponseBody.specialists
                ?.expand((specialist) => specialist.doctors ?? <DoctorsList>[])
                .toList() ??
            [];
        emit(
          HomeLoaded(homeResponseBody: homeResponseBody, doctors: allDoctors),
        );
      },
      failure: (error) {
        emit(HomeError(message: error.message.toString()));
      },
    );
  }
}
