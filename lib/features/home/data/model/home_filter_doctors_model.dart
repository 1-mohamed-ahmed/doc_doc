import 'package:json_annotation/json_annotation.dart';

part 'home_filter_doctors_model.g.dart';

@JsonSerializable()
class HomeFilterDoctorsModel {
  @JsonKey(name: 'data')
  final SpecialistsData? specialists; // this is list of some specialists
  HomeFilterDoctorsModel({required this.specialists});
  factory HomeFilterDoctorsModel.fromJson(Map<String, dynamic> json) =>
      _$HomeFilterDoctorsModelFromJson(json);
}

@JsonSerializable()
class SpecialistsData {
  final int? id;
  @JsonKey(name: 'name')
  final String? specializationName;
  final List<FilterDoctorsList>? doctors;

  SpecialistsData({
    required this.id,
    required this.specializationName,
    required this.doctors,
  });

  factory SpecialistsData.fromJson(Map<String, dynamic> json) =>
      _$SpecialistsDataFromJson(json);
}

@JsonSerializable()
class FilterDoctorsList {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  @JsonKey(name: 'photo')
  final String imageUrl;
  final String? gender;
  final String? address;
  final String? degree;
  final Map<String, dynamic>? specialization;
  @JsonKey(name: 'appoint_price')
  final int? price;
  @JsonKey(name: 'start_time')
  final String? startTime;
  @JsonKey(name: 'end_time')
  final String? endTime;
  FilterDoctorsList({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.imageUrl,
    required this.gender,
    required this.address,
    required this.degree,
    required this.specialization,
    required this.price,
    required this.startTime,
    required this.endTime,
  });

  factory FilterDoctorsList.fromJson(Map<String, dynamic> json) =>
      _$FilterDoctorsListFromJson(json);
}
