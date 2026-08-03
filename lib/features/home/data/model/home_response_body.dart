import 'package:json_annotation/json_annotation.dart';

part 'home_response_body.g.dart';

@JsonSerializable()
class HomeResponseBody {
  @JsonKey(name: 'data')
  final List<SpecialistsData>? specialists; // this is list of some specialists
  HomeResponseBody({required this.specialists});
  factory HomeResponseBody.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseBodyFromJson(json);
}

@JsonSerializable()
class SpecialistsData {
  final int? id;
  @JsonKey(name: 'name')
  final String? specializationName;
  final List<DoctorsList>? doctors;

  SpecialistsData({
    required this.id,
    required this.specializationName,
    required this.doctors,
  });

  factory SpecialistsData.fromJson(Map<String, dynamic> json) =>
      _$SpecialistsDataFromJson(json);
}

@JsonSerializable()
class DoctorsList {
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
  DoctorsList({
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

  factory DoctorsList.fromJson(Map<String, dynamic> json) =>
      _$DoctorsListFromJson(json);
}
