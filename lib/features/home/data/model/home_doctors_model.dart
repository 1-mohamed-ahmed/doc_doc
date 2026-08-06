import 'package:json_annotation/json_annotation.dart';

part 'home_doctors_model.g.dart';

@JsonSerializable()
class HomeDoctorsModel {
  @JsonKey(name: 'data')
  final List<SpecializationDoctorsData>? specializationInformation; // this is list of some specialists
  HomeDoctorsModel({required this.specializationInformation});
  factory HomeDoctorsModel.fromJson(Map<String, dynamic> json) =>
      _$HomeDoctorsModelFromJson(json);
}

@JsonSerializable()
class SpecializationDoctorsData {
  final int? id;
  @JsonKey(name: 'name')
  final String? homeSpecializationName;
  final List<HomeDoctorsList>? doctors;

  SpecializationDoctorsData({
    required this.id,
    required this.homeSpecializationName,
    required this.doctors,
  });

  factory SpecializationDoctorsData.fromJson(Map<String, dynamic> json) =>
      _$SpecializationDoctorsDataFromJson(json);
}

@JsonSerializable()
class HomeDoctorsList {
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
  HomeDoctorsList({
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

  factory HomeDoctorsList.fromJson(Map<String, dynamic> json) =>
      _$HomeDoctorsListFromJson(json);
}
