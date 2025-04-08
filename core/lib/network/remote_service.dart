// import 'dart:convert';
//
// import 'package:core/constant/app_constants.dart';
// import 'package:core/database/app_persistence.dart';
// import 'package:core/di/locator.dart';
// import 'package:core/enum/snackbar_type.dart';
// import 'package:core/routes/app_routes.dart';
// import 'package:core/shared_data/string/string_en.dart';
// import 'package:core/utils/ext.dart';
// import 'package:dio/dio.dart';
// import 'package:get/get.dart' hide Response, FormData;
//
// enum RequestMethod { GET, POST, PATCH, PUT, DELETE }
//
// enum ContentType { JSON, FORM_URL_ENCODED, QUERY, NONE }
//
// class RemoteService {
//   final dio = locator.get<Dio>();
//   final appPersistence = locator.get<AppPersistence>();
//
//   Map<String, dynamic> getHeaders(
//       {required ContentType contentType, bool useAuth = true}) {
//     if (useAuth) {
//       return {
//         Headers.contentTypeHeader: (contentType == ContentType.FORM_URL_ENCODED)
//             ? Headers.formUrlEncodedContentType
//             : Headers.jsonContentType,
//         'auth-token': appPersistence.getToken() ?? ''
//       };
//     } else {
//       return {
//         Headers.contentTypeHeader: (contentType == ContentType.FORM_URL_ENCODED)
//             ? Headers.formUrlEncodedContentType
//             : Headers.jsonContentType,
//       };
//     }
//   }
//
//   Future<String> sendRequest({
//     required RequestMethod requestMethod,
//     required String url,
//     ContentType contentType = ContentType.NONE,
//     bool useAuth = true,
//     Object body = '',
//   }) async {
//     try {
//       final response = await request(
//           requestMethod: requestMethod,
//           url: url,
//           contentType: contentType,
//           useAuth: useAuth,
//           body: body);
//
//       print(
//           'HEADER: ${getHeaders(contentType: contentType, useAuth: useAuth)}');
//       print('$requestMethod: $url');
//       print('REQUEST_BODY: $body');
//       print('RESPONSE: $response');
//
//       // Force Logout
//       if (response?.statusCode == 401) {
//         appPersistence.logout();
//         showSnackbar(StringEn.your_session_expired,
//             snackbarType: SnackbarType.ERROR);
//         Get.offAllNamed(Routes.login);
//       }
//       return response.toString();
//     } catch (error) {
//       print('error send request = $error');
//       rethrow;
//     }
//   }
//
//   Future<Response<String>?> request({
//     required RequestMethod requestMethod,
//     required String url,
//     ContentType contentType = ContentType.NONE,
//     required bool useAuth,
//     Object body = '',
//   }) async {
//     try {
//       Response<String>? response;
//
//       switch (requestMethod) {
//         case RequestMethod.GET:
//           if (contentType == ContentType.JSON) {
//             response = await dio.get(
//               '${AppConstants.BASE_URL}$url',
//               options: Options(
//                 headers: getHeaders(contentType: contentType, useAuth: useAuth),
//                 validateStatus: (status) => true,
//               ),
//               data: jsonEncode(body),
//             );
//           } else if (contentType == ContentType.FORM_URL_ENCODED) {
//             response = await dio.get(
//               '${AppConstants.BASE_URL}$url',
//               options: Options(
//                 headers: getHeaders(contentType: contentType, useAuth: useAuth),
//                 validateStatus: (status) => true,
//               ),
//               data: FormData.fromMap(getBody(body)),
//             );
//           } else if (contentType == ContentType.QUERY) {
//             response = await dio.get(
//               '${AppConstants.BASE_URL}$url',
//               options: Options(
//                 headers: getHeaders(contentType: contentType, useAuth: useAuth),
//                 validateStatus: (status) => true,
//               ),
//               queryParameters: getBody(body),
//             );
//           } else {
//             response = await dio.get(
//               '${AppConstants.BASE_URL}$url',
//               options: Options(
//                 headers: getHeaders(contentType: contentType, useAuth: useAuth),
//                 validateStatus: (status) => true,
//               ),
//             );
//           }
//           break;
//         case RequestMethod.POST:
//           if (contentType == ContentType.JSON) {
//             response = await dio.post(
//               '${AppConstants.BASE_URL}$url',
//               options: Options(
//                 headers: getHeaders(contentType: contentType, useAuth: useAuth),
//                 validateStatus: (status) => true,
//               ),
//               data: jsonEncode(body),
//             );
//           } else if (contentType == ContentType.FORM_URL_ENCODED) {
//             response = await dio.post(
//               '${AppConstants.BASE_URL}$url',
//               options: Options(
//                 headers: getHeaders(contentType: contentType, useAuth: useAuth),
//                 validateStatus: (status) => true,
//               ),
//               data: FormData.fromMap(getBody(body)),
//             );
//           } else if (contentType == ContentType.QUERY) {
//             response = await dio.post(
//               '${AppConstants.BASE_URL}$url',
//               options: Options(
//                 headers: getHeaders(contentType: contentType, useAuth: useAuth),
//                 validateStatus: (status) => true,
//               ),
//               queryParameters: getBody(body),
//             );
//           } else {
//             response = await dio.put(
//               '${AppConstants.BASE_URL}$url',
//               options: Options(
//                 headers: getHeaders(contentType: contentType, useAuth: useAuth),
//                 validateStatus: (status) => true,
//               ),
//             );
//           }
//           break;
//         case RequestMethod.PATCH:
//           break;
//         case RequestMethod.PUT:
//           if (contentType == ContentType.JSON) {
//             response = await dio.put(
//               '${AppConstants.BASE_URL}$url',
//               options: Options(
//                 headers: getHeaders(contentType: contentType, useAuth: useAuth),
//                 validateStatus: (status) => true,
//               ),
//               data: jsonEncode(body),
//             );
//           } else if (contentType == ContentType.FORM_URL_ENCODED) {
//             response = await dio.put(
//               '${AppConstants.BASE_URL}$url',
//               options: Options(
//                 headers: getHeaders(contentType: contentType, useAuth: useAuth),
//                 validateStatus: (status) => true,
//               ),
//               data: FormData.fromMap(getBody(body)),
//             );
//           } else if (contentType == ContentType.QUERY) {
//             response = await dio.put(
//               '${AppConstants.BASE_URL}$url',
//               options: Options(
//                 headers: getHeaders(contentType: contentType, useAuth: useAuth),
//                 validateStatus: (status) => true,
//               ),
//               queryParameters: getBody(body),
//             );
//           } else {
//             response = await dio.put(
//               '${AppConstants.BASE_URL}$url',
//               options: Options(
//                 headers: getHeaders(contentType: contentType, useAuth: useAuth),
//                 validateStatus: (status) => true,
//               ),
//             );
//           }
//           break;
//         case RequestMethod.DELETE:
//           if (contentType == ContentType.JSON) {
//             response = await dio.delete(
//               '${AppConstants.BASE_URL}$url',
//               options: Options(
//                 headers: getHeaders(contentType: contentType, useAuth: useAuth),
//                 validateStatus: (status) => true,
//               ),
//               data: jsonEncode(body),
//             );
//           } else if (contentType == ContentType.FORM_URL_ENCODED) {
//             response = await dio.delete(
//               '${AppConstants.BASE_URL}$url',
//               options: Options(
//                 headers: getHeaders(contentType: contentType, useAuth: useAuth),
//                 validateStatus: (status) => true,
//               ),
//               data: FormData.fromMap(getBody(body)),
//             );
//           } else if (contentType == ContentType.QUERY) {
//             response = await dio.delete(
//               '${AppConstants.BASE_URL}$url',
//               options: Options(
//                 headers: getHeaders(contentType: contentType, useAuth: useAuth),
//                 validateStatus: (status) => true,
//               ),
//               queryParameters: getBody(body),
//             );
//           } else {
//             response = await dio.delete(
//               '${AppConstants.BASE_URL}$url',
//               options: Options(
//                 headers: getHeaders(contentType: contentType, useAuth: useAuth),
//                 validateStatus: (status) => true,
//               ),
//             );
//           }
//           break;
//         default:
//           break;
//       }
//       return response;
//     } catch (error) {
//       rethrow;
//     }
//   }
// }
