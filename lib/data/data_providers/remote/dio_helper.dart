import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';

import 'api_consumer.dart';
import 'api_interceptor.dart';
import 'error/errors_handler.dart';

class DioHelper implements ApiConsumer {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        receiveDataWhenStatusError: true,
        receiveTimeout: 10 * 1000,
        connectTimeout: 10 * 1000,
      ),
    );
    dio!.interceptors.add(AppInterceptor());
    if (kDebugMode) {
      dio!.interceptors.add(LogInterceptor(
        responseBody: true,
        error: true,
        requestHeader: false,
        responseHeader: false,
        request: true,
        requestBody: true,
      ));
    }
  }

  @override
  Future get(
      {required String path, Map<String, dynamic>? queryParameters}) async {
    try {
      return await dio!.get(path, queryParameters: queryParameters);
    } on DioError catch (error) {
      ErrorsHandler.handleDioError(error);
    }
  }

  @override
  Future post(
      {required String path,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      dio!.options.headers = {
        'Content-Type': 'application/json',
      };
      return await dio!.post(path, data: body);
    } on DioError catch (error) {
      ErrorsHandler.handleDioError(error);
    }
  }
}
