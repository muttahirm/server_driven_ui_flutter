import 'package:dio/dio.dart';
import 'package:server_driven_ui_flutter/core/network/auth_interceptor.dart';
import 'package:server_driven_ui_flutter/core/network/logging_interceptor.dart';

class DioClient {
  static Dio create({
    required String baseUrl,
    required Future<String?> Function() getToken,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: const {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.addAll([
      AuthInterceptor(getToken: getToken),
      LoggingInterceptor(),
    ]);
    return dio;
  }
}
