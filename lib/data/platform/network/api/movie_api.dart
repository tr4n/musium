import 'dart:io';

import 'package:dio/dio.dart';

import '../response/error_response.dart';

class MovieApi {
  final int _timeOut = 10000; //10s
  late Dio _dio;
  static const _apiKey = "d61ca0998c8a152c6556e310a4a8e4db";

  MovieApi() {
    BaseOptions options =
        BaseOptions(connectTimeout: _timeOut, receiveTimeout: _timeOut);
    Map<String, dynamic> headers = {};
    /*
    Http request headers.
    headers["content-type"] = "application/json";
   */
    options.headers = headers;
    _dio = Dio(options)
      ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true))
      ..options.queryParameters.addAll({"api_key": _apiKey});
  }

  Future<Response?> get(
      {required String url, Map<String, dynamic> params = const {}}) async {
    try {
      return await _dio.get(
        url,
        queryParameters: params,
        options: Options(responseType: ResponseType.json),
      );
    } on DioError catch (e) {
      //handle error
      _handelError(e, url);
      print("DioError: ${e.toString()}");
    }
  }

  Future<Response?> post(
      {required String url, Map<String, dynamic> body = const {}}) async {
    try {
      Response response = await _dio.post(
        url,
        data: body,
        options: Options(responseType: ResponseType.json),
      );
      return response;
    } on DioError catch (e) {
      //handle error
      print("DioError: ${e.toString()}");
      throw _handelError(e, url);
    }
  }

  Response _handelError(dynamic error, String url) {
    try {
      if (error is DioError) {
        switch (error.type) {
          case DioErrorType.cancel:
          case DioErrorType.connectTimeout:
          case DioErrorType.receiveTimeout:
          case DioErrorType.sendTimeout:
          case DioErrorType.other:
            if (error.error is SocketException) {
              return ErrorResponse(
                data: error.error,
                statusMessage: error.message,
                statusCode: ErrorResponse.NETWORK_ERROR_CODE,
                path: url,
              );
            }
            return ErrorResponse(
              data: error.error,
              statusMessage: error.message,
              path: url,
            );
          case DioErrorType.response:
            return ErrorResponse(
              data: error.response!.data,
              statusMessage: error.response!.statusMessage,
              statusCode: error.response!.statusCode,
              path: url,
            );
          default:
            return ErrorResponse(
              data: error.error,
              statusMessage: error.message,
              path: url,
            );
        }
      }
    } catch (ex) {
      return ErrorResponse(data: ex.toString(), path: url);
    }
    return ErrorResponse(data: error.toString(), path: url);
  }
}
