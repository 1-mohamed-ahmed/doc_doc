import 'package:doc_doc/features/home/data/model/home_response_body.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final HomeResponseBody homeResponseBody;
  final List<DoctorsList> doctors;
  const HomeLoaded({required this.homeResponseBody, required this.doctors});
}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});
}
