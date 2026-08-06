// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_doctors_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllDoctorsModel _$AllDoctorsModelFromJson(Map<String, dynamic> json) =>
    AllDoctorsModel(
      docotors: (json['data'] as List<dynamic>?)
          ?.map((e) => AllDoctorsList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllDoctorsModelToJson(AllDoctorsModel instance) =>
    <String, dynamic>{'data': instance.docotors};

AllDoctorsList _$AllDoctorsListFromJson(Map<String, dynamic> json) =>
    AllDoctorsList(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      imageUrl: json['photo'] as String,
      gender: json['gender'] as String?,
      address: json['address'] as String?,
      degree: json['degree'] as String?,
      specialization: json['specialization'] as Map<String, dynamic>?,
      city: json['city'] as Map<String, dynamic>?,
      price: (json['appoint_price'] as num?)?.toInt(),
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
    );

Map<String, dynamic> _$AllDoctorsListToJson(AllDoctorsList instance) =>
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
      'city': instance.city,
      'appoint_price': instance.price,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
    };
