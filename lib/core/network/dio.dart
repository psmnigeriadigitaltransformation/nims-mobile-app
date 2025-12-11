import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../services/local/shared_preferences_helper.dart';

final Dio dio = Dio(
  BaseOptions(
    baseUrl: "http://demonims.nigeriascdw.org/api/v1/",
    connectTimeout: Duration(seconds: 90),
    receiveTimeout: Duration(seconds: 90),
    validateStatus: (code) => true,
    preserveHeaderCase: true
  ),
)..interceptors.add(
  InterceptorsWrapper(
    onRequest: (options, handler) async {
      final token = await SharedPreferencesHelper.getToken();

      if (token != null && token.isNotEmpty && !options.path.contains('auth/login')) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      options.headers['Content-Type'] = 'application/json';
      options.headers['Accept'] = 'application/json';

      developer.log('REQUEST[${options.method}] => PATH: ${options.path}, BASEURL: ${options.baseUrl}, URI: ${options.uri}, HEADERS: ${options.headers}');

      return handler.next(options);    },
    onResponse: (response, handler) {
      developer.log('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
      debugPrint('DATA: ${response.data}');
      return handler.next(response);
    },
    onError: (DioException e, handler) {
      developer.log('ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}');
      return handler.next(e);
    },
  ),
);
