import 'package:dio/dio.dart';

import 'package:taskema/data/network/intercepter/logging_interceptor.dart';

abstract class AuthTokenListener {
  void onAuthTokenChanged(String? accessToken, String? refreshToken);
}

class DioProvider {
  static late Dio _dio;
  static late Dio _dioWhithoutAuth;
  static late Dio _dioFileUploader;

  static String? _accessToken;
  static String? _refreshToken;

  static AuthTokenListener? _authTokenListener;

  static final DioProvider _instance = DioProvider._internal();
  factory DioProvider() => _instance;

  DioProvider._internal() {
    _dioWhithoutAuth = Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {"Content-Type": "application/json"}))
      ..interceptors.add(LoggingInterceptor());
    _dioFileUploader = Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {"Content-Type": "multipart/form-data"}))
      // ..interceptors.add(AuthenticationInterceptor())
      ..interceptors.add(LoggingInterceptor());
    _dio = Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {
          "Content-Type": "application/json"
        }))
      // ..interceptors.add(AuthenticationInterceptor())
      ..interceptors.add(LoggingInterceptor());
  }

  static Dio getDio() => _dio;
  static Dio getDioWithoutAuth() => _dioWhithoutAuth;
  static Dio getDioFileUploader() => _dioFileUploader;

  static void addAuthTokenListener(AuthTokenListener listener) {
    _authTokenListener = listener;
  }

  static void triggerTokenListener(String? accessToken, String? refreshToken) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;

    if (_authTokenListener != null) {
      _authTokenListener!.onAuthTokenChanged(_accessToken, _refreshToken);
    }
  }
}
