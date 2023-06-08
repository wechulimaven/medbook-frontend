import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../shared/service/navigation_service.dart';
import '../local_storage/shared_preference_helper.dart';
import 'endpoints.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/error_interceptor.dart';

class DioClient {
  final AuthInterceptor authInterceptor;
  final SharedHelper sharedHelper;
  final NavigationService navigationService;

  DioClient(
    this.authInterceptor,
    this.sharedHelper,
    this.navigationService,
  );
  Dio get dio => _getDio();

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: Url.baseUrl!,
      connectTimeout: const Duration(milliseconds: 50000),
      receiveTimeout: const Duration(milliseconds: 30000),
    );
    Dio dio = Dio(options);

    dio.interceptors
      ..add(authInterceptor)
      ..add(
        ErrorInterceptor(
          sharedHelper,
          dio,
          navigationService,
        ),
      );
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
        ),
      );
    }

    return dio;
  }
}
