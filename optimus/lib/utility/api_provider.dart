import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:optimus/utility/logging_interceptor.dart';
import 'package:optimus/utility/api_endpoint.dart';

class ApiProvider {
  Dio? _dio;

  ApiProvider() {
    BaseOptions options =
    BaseOptions(receiveTimeout: 100000, connectTimeout: 100000);
    _dio = Dio(options);
    _dio!.interceptors.add(LoggingInterceptor());
    Map<String, dynamic> customHeaders = {
      'content-type': 'application/json',
    };
    options.headers.addAll(customHeaders);
    loadAuthorizationHeader();
  }

  Future<void> loadAuthorizationHeader() async {
    /*if (!_dio.options.headers.containsKey('Authorization') && user != null) {
      _dio.options.headers['Authorization'] = 'Bearer ${user.accessToken}';
    }*/
  }



  String _handleError(Error error) {
    String errorDescription = "";
    if (error is DioError) {
      DioError dioError = error as DioError;
      switch (dioError.type) {
        case DioErrorType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.connectTimeout:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.response:
          errorDescription =
          "Received invalid status code: ${dioError.response!.statusCode}";
          break;
        case DioErrorType.sendTimeout:
          errorDescription = "Send timeout in connection with API server";
          break;
        default:
          errorDescription =
          "Connection to API server failed due to internet connection";
          break;
      }
    } else {
      errorDescription = "Unexpected error occurred";
    }
    return errorDescription;
  }
}