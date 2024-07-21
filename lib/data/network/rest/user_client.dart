import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:taskema/data/network/core/api_url.dart';

part 'user_client.g.dart';

@RestApi(baseUrl: ApiUrl.USER)
abstract class UserClient {
  factory UserClient(Dio dio, {String baseUrl}) = _UserClient;

  @GET("/register")
  Future<String> register(@Path("phone_number") String phoneNumber);
}
