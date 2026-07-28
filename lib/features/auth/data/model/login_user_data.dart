import 'package:json_annotation/json_annotation.dart';

part 'login_user_data.g.dart';

@JsonSerializable()
class UserData {
  final String? username;
  final String? token;
  UserData({this.token, this.username});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
