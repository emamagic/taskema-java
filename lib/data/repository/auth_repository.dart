import 'package:taskema/data/network/core/base_repository.dart';
import 'package:taskema/data/network/core/dio_provider.dart';
import 'package:taskema/data/network/core/future_network_extensions.dart';
import 'package:taskema/data/network/core/result_wrapper.dart';
import 'package:taskema/data/network/rest/auth_client.dart';
import 'package:taskema/model/dto/hello.dart';
import 'package:taskema/model/dto/user_register_username_password_request.dart';
import 'package:taskema/model/entity/auth_token.dart';

class AuthRepository extends BaseRepository<AuthClient> {
  AuthRepository() : super(restProvider: AuthClient(DioProvider.getDio()));

  Future<ResultWrapper<AuthToken>> register(
          UserRegisterUsernamePasswordRequest req) =>
      restProvider
          .register(req)
          .map((res) => AuthToken(
              accessToken: res.accessToken, refreshToken: res.refreshToken))
          .exec();

  Future<ResultWrapper<Hello>> hello() => restProvider.hello().exec();
}
