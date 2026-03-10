import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('Request: ${options.method} ${options.uri}');
    debugPrint('Headers: ${options.headers}');
    debugPrint('Data: ${options.data}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
      'Response: ${response.statusCode} ${response.requestOptions.uri}',
    );
    debugPrint('Data: ${response.data}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('Error: ${err.response?.statusCode} ${err.requestOptions.uri}');
    debugPrint('Message: ${err.message}');
    handler.next(err);
  }
}
