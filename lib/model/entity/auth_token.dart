import 'package:json_annotation/json_annotation.dart';

part 'auth_token.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AuthToken {
  final String accessToken;
  final String refreshToken;
  AuthToken({
    required this.accessToken,
    required this.refreshToken,
  });

    factory AuthToken.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenFromJson(json);

  Map<String, dynamic> toJson() => _$AuthTokenToJson(this);
}