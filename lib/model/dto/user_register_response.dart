import 'package:json_annotation/json_annotation.dart';

part 'user_register_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserRegisterResponse {
  final String accessToken;
  final String refreshToken;

  UserRegisterResponse({required this.accessToken, required this.refreshToken});

  factory UserRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserRegisterResponseToJson(this);
}
