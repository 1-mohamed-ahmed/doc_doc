// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponseBody _$HomeResponseBodyFromJson(Map<String, dynamic> json) =>
    HomeResponseBody(
      specialists: (json['data'] as List<dynamic>?)
          ?.map((e) => SpecialistsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeResponseBodyToJson(HomeResponseBody instance) =>
    <String, dynamic>{'data': instance.specialists};

SpecialistsData _$SpecialistsDataFromJson(Map<String, dynamic> json) =>
    SpecialistsData(
      id: (json['id'] as num?)?.toInt(),
      specializationName: json['name'] as String?,
      doctors: (json['doctors'] as List<dynamic>?)
          ?.map((e) => DoctorsList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpecialistsDataToJson(SpecialistsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.specializationName,
      'doctors': instance.doctors,
    };

DoctorsList _$DoctorsListFromJson(Map<String, dynamic> json) => DoctorsList(
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

Map<String, dynamic> _$DoctorsListToJson(DoctorsList instance) =>
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
