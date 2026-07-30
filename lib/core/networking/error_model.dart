// import 'package:json_annotation/json_annotation.dart';

// part 'error_model.g.dart';

// @JsonSerializable()
// class ErrorModel {
//   final int? code;
//   final String? message;
//   final dynamic data;

//   ErrorModel({this.code, this.message, this.data});

//   factory ErrorModel.fromJson(Map<String, dynamic> json) =>
//       _$ErrorModelFromJson(json);

//   Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
// }

import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  final int? code;
  final String? message;
  final dynamic data;
  final bool? status;

  ErrorModel({this.code, this.message, this.data, this.status});

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);

  String getAllErrorMessages() {
    if (data is Map<String, dynamic>) {
      final Map<String, dynamic> errorsMap = data as Map<String, dynamic>;

      if (errorsMap.isNotEmpty) {
        // ترتيب أولويات الحقول
        final List<String> fieldPriorityOrder = [
          'email',
          'phone',
          'password',
          'password_confirmation',
        ];

        // البحث عن أول حقل به خطأ حسب الترتيب
        for (var field in fieldPriorityOrder) {
          if (errorsMap.containsKey(field)) {
            final value = errorsMap[field];
            if (value is List && value.isNotEmpty) {
              return value.first.toString();
            } else if (value is String) {
              return value;
            }
          }
        }

        final firstKey = errorsMap.keys.first;
        final firstValue = errorsMap[firstKey];
        if (firstValue is List && firstValue.isNotEmpty) {
          return firstValue.first.toString();
        } else if (firstValue is String) {
          return firstValue;
        }
      }
    }

    // الـ Fallback في حالة عدم وجود data
    return message ?? "An unexpected error occurred. Please try again.";
  }
}
