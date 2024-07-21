import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:taskema/data/network/core/api_url.dart';
import 'package:taskema/model/dto/hello.dart';
import 'package:taskema/model/dto/user_register_username_password_request.dart';
import 'package:taskema/model/dto/user_register_response.dart';

part 'auth_client.g.dart';

@RestApi(baseUrl: ApiUrl.AUTH)
abstract class AuthClient {
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  @POST("/register")
  Future<UserRegisterResponse> register(
      @Body() UserRegisterUsernamePasswordRequest req);

  @GET("/hello")
  Future<Hello> hello();
}
