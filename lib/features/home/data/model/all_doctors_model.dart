import 'package:json_annotation/json_annotation.dart';

part 'all_doctors_model.g.dart';

@JsonSerializable()
class AllDoctorsModel {
  @JsonKey(name: 'data')
  final List<AllDoctorsList>? docotors;
  AllDoctorsModel({required this.docotors});
  factory AllDoctorsModel.fromJson(Map<String, dynamic> json) =>
      _$AllDoctorsModelFromJson(json);
}

@JsonSerializable()
class AllDoctorsList {
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
  final Map<String, dynamic>? city;
  @JsonKey(name: 'appoint_price')
  final int? price;
  @JsonKey(name: 'start_time')
  final String? startTime;
  @JsonKey(name: 'end_time')
  final String? endTime;
  AllDoctorsList({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.imageUrl,
    required this.gender,
    required this.address,
    required this.degree,
    required this.specialization,
    required this.city,
    required this.price,
    required this.startTime,
    required this.endTime,
  });

  factory AllDoctorsList.fromJson(Map<String, dynamic> json) =>
      _$AllDoctorsListFromJson(json);
}
