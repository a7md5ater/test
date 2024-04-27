import 'package:dio/dio.dart';
import 'package:test/core/apis/doctors/app_end_points.dart';

abstract class AppDio {
  Dio dio();
}

class AppDioImpl implements AppDio {
  @override
  Dio dio() {
    final dio = Dio();

    dio.options
      ..baseUrl = AppEndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer 123456',
      }
      ..connectTimeout = const Duration(seconds: 60)
      // ..receiveTimeout = const Duration(seconds: 60)
      ..followRedirects = false;

    dio.interceptors.add(
      LogInterceptor(
          request: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
          error: true),
    );

    return dio;
  }
}
