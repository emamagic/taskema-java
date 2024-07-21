import 'package:kiwi/kiwi.dart';
import 'package:taskema/data/repository/auth_repository.dart';
import 'package:taskema/data/repository/user_repository.dart';

final KiwiContainer kiwiContainer = KiwiContainer();

void setupKiwi() {
  kiwiContainer.registerSingleton<UserRepository>((c) => UserRepository());
  kiwiContainer.registerSingleton<AuthRepository>((c) => AuthRepository());
}
