import 'package:dio/dio.dart';

abstract class AppApi {
  Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  });

  Future<Response> post({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  });
}

class AppApiImpl implements AppApi {
  final Dio _dio;

  AppApiImpl({required Dio dio}) : _dio = dio;
  @override
  Future<Response> post({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) {
    return _dio.post(
      endPoint,
      queryParameters: queryParameters,
      data: body,
    );
  }

  @override
  Future<Response> get(
      {required String endPoint, Map<String, dynamic>? queryParameters}) {
    return _dio.get(
      endPoint,
      queryParameters: queryParameters,
    );
  }
}
