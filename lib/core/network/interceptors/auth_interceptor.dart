import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../local_storage/shared_preference_helper.dart';

class AuthInterceptor extends Interceptor {
  final SharedHelper sharedHelper;
  String? baseUrl = dotenv.env['API_BASE_URL'];

  AuthInterceptor(this.sharedHelper);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.path == '${baseUrl}seller/business/signup/update') {
      var token = await sharedHelper.getAccessToken();

      if (token != null) {
        options.headers[HttpHeaders.authorizationHeader] = token;
      }

      handler.next(options);
    } else {
      if (options.path.contains('signin') || options.path.contains('signup')) {
        handler.next(options);
      } else {
        var token = await sharedHelper.getAccessToken();

        if (token != null) {
          options.headers[HttpHeaders.authorizationHeader] = token;
        }
        handler.next(options);
      }
    }
  }
}
