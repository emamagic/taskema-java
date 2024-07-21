// import 'dart:async';
// import 'package:dio/dio.dart';
// import 'package:taskema/data/network/core/dio_provider.dart';
// import 'package:taskema/core/logger.dart';

// class AuthenticationInterceptor extends Interceptor {
//   List<Map<dynamic, dynamic>> failedRequests = [];
//   bool isRefreshing = false;

//   @override
//   void onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     var accessToken = PrefDao.instance.getAccessToken;
//     options.headers["Authorization"] = "Bearer $accessToken";

//     return super.onRequest(options, handler);
//   }

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async {
//     Logger.info("sSSS", err.requestOptions.path);
//     if (err.response?.statusCode == 401 &&
//         err.requestOptions.path != "v1/auth/verify_code") {
//       if ((PrefDao.instance.getAccessToken ?? "").isEmpty) {
//         EventPublisher.getInstance().fire(NeedToSignupEvent());
//         return handler.reject(err);
//       }
//       if (!isRefreshing) {
//         isRefreshing = true;
//         final isSuccess = await refreshToken(err, handler);
//         if (isSuccess) {
//           err.requestOptions.headers['Authorization'] =
//               'Bearer ${PrefDao.instance.getAccessToken}';
//         } else {
//           err.error = ErrorResponse(
//             causes: "Session Expired",
//             status: 511,
//           );
//           return handler.next(err);
//         }
//       } else {
//         failedRequests.add({'err': err, 'handler': handler});
//       }
//     } else {
//       return handler.next(err);
//     }
//   }

//   FutureOr<bool> refreshToken(
//       DioError err, ErrorInterceptorHandler handler) async {
//     String? refreshToken = PrefDao.instance.getRefreshToken;
//     Response<dynamic> response;
//     try {
//       response = await DioProvider.getDioWithoutAuth().post(
//           BaseConfig.authUrl + BaseConfig.authPath,
//           data: {"refresh_token": refreshToken});
//       var refreshTokenResponse = VerifyAuthDto.fromJson(response.data);
//       if (err.response!.statusCode != 511) {
//         DioProvider.triggerTokenListener(refreshTokenResponse.accessToken!,
//             refreshTokenResponse.refreshToken!);

//         failedRequests.add({'err': err, 'handler': handler});
//         RequestOptions options = err.requestOptions;
//         await retryRequests("${options.baseUrl}${options.path}",
//             refreshTokenResponse.accessToken!);
//         return true;
//       } else {
//         isRefreshing = false;
//         return false;
//       }
//     } on DioError catch (e) {
//       if (e.response!.statusCode == 401 || e.response!.statusCode == 403) {
//         EventPublisher.getInstance().fire(NeedToSignupEvent());
//         Logger.info("refresh token called ", "NeedToSignupEvent");
//         return false;
//       }
//     } catch (e) {
//       Logger.error("Refresh Token ", e.toString());
//     }
//     return false;
//   }

//   Future retryRequests(baseUrl, token) async {
//     Dio retryDio = DioProvider.getDioWithoutAuth()..options.baseUrl = baseUrl;
//     for (var i = 0; i < failedRequests.length; i++) {
//       RequestOptions requestOptions =
//           failedRequests[i]['err'].requestOptions as RequestOptions;

//       requestOptions.headers = {
//         'Authorization': 'Bearer $token',
//       };

//       await retryDio.fetch(requestOptions).then(
//         failedRequests[i]['handler'].resolve,
//         onError: (error) async {
//           failedRequests[i]['handler'].reject(error as DioError);
//         },
//       );
//     }
//     isRefreshing = false;
//     failedRequests = [];
//   }
// }
