// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_doctors_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDoctorsModel _$HomeDoctorsModelFromJson(Map<String, dynamic> json) =>
    HomeDoctorsModel(
      specializationInformation: (json['data'] as List<dynamic>?)
          ?.map(
            (e) =>
                SpecializationDoctorsData.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$HomeDoctorsModelToJson(HomeDoctorsModel instance) =>
    <String, dynamic>{'data': instance.specializationInformation};

SpecializationDoctorsData _$SpecializationDoctorsDataFromJson(
  Map<String, dynamic> json,
) => SpecializationDoctorsData(
  id: (json['id'] as num?)?.toInt(),
  homeSpecializationName: json['name'] as String?,
  doctors: (json['doctors'] as List<dynamic>?)
      ?.map((e) => HomeDoctorsList.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SpecializationDoctorsDataToJson(
  SpecializationDoctorsData instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.homeSpecializationName,
  'doctors': instance.doctors,
};

HomeDoctorsList _$HomeDoctorsListFromJson(Map<String, dynamic> json) =>
    HomeDoctorsList(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      imageUrl: json['photo'] as String,
      gender: json['gender'] as String?,
      address: json['address'] as String?,
      degree: json['degree'] as String?,
      specialization: json['specialization'] as Map<String, dynamic>?,
      price: (json['appoint_price'] as num?)?.toInt(),
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
    );

Map<String, dynamic> _$HomeDoctorsListToJson(HomeDoctorsList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'photo': instance.imageUrl,
      'gender': instance.gender,
      'address': instance.address,
      'degree': instance.degree,
      'specialization': instance.specialization,
      'appoint_price': instance.price,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
    };
