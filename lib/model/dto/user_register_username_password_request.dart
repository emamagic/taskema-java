import 'package:json_annotation/json_annotation.dart';

part 'user_register_username_password_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserRegisterUsernamePasswordRequest {
  final String username;
  final String password;
  UserRegisterUsernamePasswordRequest({
    required this.username,
    required this.password,
  });

  factory UserRegisterUsernamePasswordRequest.fromJson(
          Map<String, dynamic> json) =>
      _$UserRegisterUsernamePasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserRegisterUsernamePasswordRequestToJson(this);
}
