// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_doctors_specialization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllDoctorsSpecialization _$AllDoctorsSpecializationFromJson(
  Map<String, dynamic> json,
) => AllDoctorsSpecialization(
  specializationsData: (json['data'] as List<dynamic>?)
      ?.map((e) => SpecializationsOfData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AllDoctorsSpecializationToJson(
  AllDoctorsSpecialization instance,
) => <String, dynamic>{'data': instance.specializationsData};

SpecializationsOfData _$SpecializationsOfDataFromJson(
  Map<String, dynamic> json,
) => SpecializationsOfData(
  id: (json['id'] as num?)?.toInt(),
  specializationName: json['name'] as String?,
  alldoctors: (json['alldoctors'] as List<dynamic>?)
      ?.map((e) => AllDoctors.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SpecializationsOfDataToJson(
  SpecializationsOfData instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.specializationName,
  'alldoctors': instance.alldoctors,
};

AllDoctors _$AllDoctorsFromJson(Map<String, dynamic> json) => AllDoctors(
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

Map<String, dynamic> _$AllDoctorsToJson(AllDoctors instance) =>
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
