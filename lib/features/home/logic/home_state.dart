import 'package:doc_doc/features/home/data/model/all_doctors_model.dart';
import 'package:doc_doc/features/home/data/model/all_doctors_specialization.dart';
import 'package:doc_doc/features/home/data/model/home_doctors_model.dart';
import 'package:doc_doc/features/home/data/model/home_filter_doctors_model.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {}

// ========================
// home doctors states
// ========================

class HomeDoctorsLoading extends HomeState {}
class HomeDoctorsLoaded extends HomeState {
  final HomeDoctorsModel? homedoctors;
  const HomeDoctorsLoaded({required this.homedoctors});
}
class HomeDoctorsError extends HomeState {
  final String message;

  const HomeDoctorsError({required this.message});
}

// ========================
// ========================

// ========================
// home doctors specialization states
// ========================


class AllSpecializationLoading extends HomeState {}
class AllSpecializationLoaded extends HomeState {
 final AllDoctorsSpecialization?  allSpecialization;

  const AllSpecializationLoaded({required this.allSpecialization});
}

class AllSpecializationError extends HomeState {
  final String message;

  const AllSpecializationError({required this.message});
}


// ========================
// ========================



// ========================
// home doctors specialization by id states
// ========================



class DoctorsSpecializationByIdLoading extends HomeState {}

class DoctorsSpecializationByIdLoaded extends HomeState {
  final List<FilterDoctorsList>? getDoctorsSpecializationById;

  const DoctorsSpecializationByIdLoaded({
    required this.getDoctorsSpecializationById,
  });
}
class DoctorsSpecializationByIdError extends HomeState {
  final String message;

  const DoctorsSpecializationByIdError({required this.message});
}


// ========================
// ========================



// ========================
// home all doctors states
// ========================

class AllDoctorsLoading extends HomeState {}


class AllDoctorsLoaded extends HomeState {
  final AllDoctorsModel? allDoctors;

  const AllDoctorsLoaded({required this.allDoctors});
}


class AllDoctorsError extends HomeState {
  final String message;

  const AllDoctorsError({required this.message});
}
