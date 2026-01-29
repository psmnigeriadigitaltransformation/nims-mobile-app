import 'package:dio/dio.dart';
import 'interceptors.dart';

final Dio dio = Dio(
  BaseOptions(
    baseUrl: "http://demonims.nigeriascdw.org/api/v1/",
    connectTimeout: Duration(seconds: 90),
    receiveTimeout: Duration(seconds: 90),
    validateStatus: (code) => true,
    preserveHeaderCase: true,
  ),
)..interceptors.addAll([requestHeadersInterceptor, requestLoggerInterceptor]);
