import 'package:flutter/widgets.dart';

@immutable
abstract class LoginState {}

class LoginInitState extends LoginState {}

class UsernameAndPasswordSubmit extends LoginState {}

class UsernameAndPasswordSuccess extends LoginState {
  final String message;
  UsernameAndPasswordSuccess({required this.message});
}

class UsernameAndPasswordFailed extends LoginState {}
