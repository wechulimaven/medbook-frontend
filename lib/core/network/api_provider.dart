import 'dart:convert';

import 'package:dio/dio.dart';

import '../di/injector.dart';

class ApiProvider {
  Dio dio;

  ApiProvider({required this.dio});

  Future<dynamic> post(Map payload, String url,
      {Map<String, dynamic>? headers}) async {
    try {
      final response = await dio.post(url,
          data: jsonEncode(payload), options: Options(headers: headers));
      return response.data;
    } on DioError {
      rethrow;
    }
  }

  Future<dynamic> delete(Map payload, String url) async {
    try {
      final response = await dio.delete(url, data: jsonEncode(payload));
      return response.data;
    } on DioError {
      rethrow;
    }
  }

  Future<dynamic> put(Map payload, String url) async {
    try {
      final response = await dio.put(url, data: jsonEncode(payload));
      return response.data;
    } on DioError {
      rethrow;
    }
  }

  Future<dynamic> get(String url,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await inject.get<Dio>().get(url, queryParameters: queryParameters);
      return response.data;
    } on DioError {
      rethrow;
    }
  }

  Future<dynamic> patch(Map payload, String url) async {
    try {
      final response = await dio.patch(url, data: jsonEncode(payload));
      return response.data;
    } on DioError {
      rethrow;
    }
  }
}
