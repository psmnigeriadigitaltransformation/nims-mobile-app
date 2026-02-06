import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../services/local/shared_preferences_helper.dart';

final requestLoggerInterceptor = InterceptorsWrapper(
  onRequest: (options, handler) async {
    developer.log(
      "REQUEST ${options.method} \n"
      "PATH: ${options.path} \n"
      "BASEURL: ${options.baseUrl} \n"
      "URI: ${options.uri} \n"
      "HEADERS: ${options.headers} \n"
      "EXTRA: ${options.extra}",
      name: "requestLoggerInterceptor",
    );

    return handler.next(options);
  },
  onResponse: (response, handler) {
    developer.log(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
      name: "requestLoggerInterceptor",
    );
    developer.log('RESPONSE: $response',  name: "requestLoggerInterceptor",);
    developer.log('DATA: ${response.data}',  name: "requestLoggerInterceptor",);
    return handler.next(response);
  },
  onError: (DioException e, handler) {
    developer.log(
      'ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}',
      name: "requestLoggerInterceptor",
    );
    return handler.next(e);
  },
);

final requestHeadersInterceptor = InterceptorsWrapper(
  onRequest: (options, handler) async {
    final token = await SharedPreferencesHelper.getToken();

    if (token != null &&
        token.isNotEmpty &&
        !options.path.contains('auth/login')) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';

    return handler.next(options);
  },
);
