import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:taskema/data/network/core/result_wrapper.dart';
import 'package:taskema/data/repository/auth_repository.dart';
import 'package:taskema/model/dto/user_register_username_password_request.dart';
import 'package:taskema/module/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitState());
  final KiwiContainer _container = KiwiContainer();

  void registerByUsernamePassword(UserRegisterUsernamePasswordRequest req) {
    // validation

    _container.resolve<AuthRepository>().hello().then((result) => {
      if (result.status == ResultStatus.success)
        emit(UsernameAndPasswordSuccess(message: result.data!.hello))
      else
        emit(UsernameAndPasswordFailed())
    });
    // _container.resolve<AuthRepository>().register(req).then((result) => {
    //   if (result.status == ResultStatus.success)
    //     emit(UsernameAndPasswordSuccess())
    //   else
    //     emit(UsernameAndPasswordFailed())
    // });
  }
}
