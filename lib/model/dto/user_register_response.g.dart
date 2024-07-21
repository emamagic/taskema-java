// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRegisterResponse _$UserRegisterResponseFromJson(
        Map<String, dynamic> json) =>
    UserRegisterResponse(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$UserRegisterResponseToJson(
        UserRegisterResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
