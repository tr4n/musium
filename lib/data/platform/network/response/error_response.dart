import 'package:dio/dio.dart';

class ErrorResponse extends Response {
  static const int NETWORK_ERROR_CODE = 0;

  ErrorResponse({
    dynamic data,
    int? statusCode,
    String? statusMessage,
    required String path,
  }) : super(
            data: data,
            statusCode: statusCode,
            statusMessage: statusMessage,
            requestOptions: RequestOptions(path: path));
}
