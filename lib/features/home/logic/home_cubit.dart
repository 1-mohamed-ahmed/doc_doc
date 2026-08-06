import 'package:bloc/bloc.dart';
import 'package:doc_doc/core/networking/api_result.dart';
import 'package:doc_doc/features/home/data/repository/home_repo.dart';
import 'package:doc_doc/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeInitial());

  // =============================
  // fetch home doctors from repo
  // =============================

  Future<void> getHomeDoctors() async {
    emit(HomeDoctorsLoading());

    final response = await _homeRepo.getHomeDoctors();
    if (isClosed) return;
    response.when(
      success: (homeResponseBody) {
        if (!isClosed) {
          emit(HomeDoctorsLoaded(homedoctors: homeResponseBody));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(HomeDoctorsError(message: error.message.toString()));
        }
      },
    );
  }

  // =============================
  // fetch all doctors from repo
  // =============================

  Future<void> getAllDoctors() async {
    emit(AllDoctorsLoading());

    final response = await _homeRepo.getAllDoctors();
    if (isClosed) return;
    response.when(
      success: (homeAllDoctors) {
        if (!isClosed) {
          emit(AllDoctorsLoaded(allDoctors: homeAllDoctors));
        }
      },
      failure: (error) {
        emit(AllDoctorsError(message: error.message.toString()));
      },
    );
  }

  // =============================
  // fetch doctors specializations from repo
  // =============================

  Future<void> getAllSpecialziation() async {
    emit(AllSpecializationLoading());

    final response = await _homeRepo.getAllSpecialization();
    if (isClosed) return;
    response.when(
      success: (specializations) {
        if (!isClosed) {
          emit(AllSpecializationLoaded(allSpecialization: specializations));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(AllSpecializationError(message: error.message.toString()));
        }
      },
    );
  }

  // =============================
  // fetch filters doctors by id from repo
  // =============================

  // List<FilterDoctorsList> specializationDoctors = [];

  Future<void> getFilterDoctors(String id) async {
    emit(DoctorsSpecializationByIdLoading());
    final specializationDoctoctors = await _homeRepo
        .getDoctorSpecializationsById(id);

    if (isClosed) return;
    specializationDoctoctors.when(
      success: (specializationDoctorList) {
        if (!isClosed) {
          emit(
            DoctorsSpecializationByIdLoaded(
              getDoctorsSpecializationById: specializationDoctorList,
            ),
          );
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(
            DoctorsSpecializationByIdError(message: error.message.toString()),
          );
        }
      },
    );
  }
}
