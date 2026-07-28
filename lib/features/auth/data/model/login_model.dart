import 'package:doc_doc/features/auth/data/model/login_user_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  final String? message;
  final int? code;
  final UserData? data;
  final bool? status;
  LoginModel({this.code, this.message, this.data, this.status});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
