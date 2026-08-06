import 'package:json_annotation/json_annotation.dart';

part 'all_doctors_specialization.g.dart';

@JsonSerializable()
class AllDoctorsSpecialization {
  @JsonKey(name: 'data')
  final List<SpecializationsOfData>? specializationsData;
  AllDoctorsSpecialization({required this.specializationsData});
  factory AllDoctorsSpecialization.fromJson(Map<String, dynamic> json) =>
      _$AllDoctorsSpecializationFromJson(json);
}

@JsonSerializable()
class SpecializationsOfData {
  final int? id;
  @JsonKey(name: 'name')
  final String? specializationName;
  final List<AllDoctors>? alldoctors;

  SpecializationsOfData({
    required this.id,
    required this.specializationName,
    required this.alldoctors,
  });

  factory SpecializationsOfData.fromJson(Map<String, dynamic> json) =>
      _$SpecializationsOfDataFromJson(json);
}

@JsonSerializable()
class AllDoctors {
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
  AllDoctors({
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

  factory AllDoctors.fromJson(Map<String, dynamic> json) =>
      _$AllDoctorsFromJson(json);
}
