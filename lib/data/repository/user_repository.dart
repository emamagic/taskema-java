import 'package:taskema/data/network/core/base_repository.dart';
import 'package:taskema/data/network/core/dio_provider.dart';
import 'package:taskema/data/network/rest/user_client.dart';

class UserRepository extends BaseRepository<UserClient> {
  UserRepository(): super(restProvider: UserClient(DioProvider.getDio()));




  
}