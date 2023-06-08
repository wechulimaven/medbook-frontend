// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';

import '../../../shared/service/navigation_service.dart';
import '../../data/errors_model.dart';
import '../../local_storage/shared_preference_helper.dart';
import '../endpoints.dart';

class ErrorInterceptor extends Interceptor {
  final SharedHelper sharedHelper;
  final Dio dio;
  final NavigationService navigationService;

  ErrorInterceptor(this.sharedHelper, this.dio, this.navigationService);
  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    var rAccToken = await sharedHelper.isAccessTokenRefreshed();
    if (rAccToken) {
      await sharedHelper.clearKey(refreshed_access_token);
    }
    return super.onResponse(response, handler);
  }

  @override
  Future onError(
      DioError err, ErrorInterceptorHandler errorInterceptorHandler) async {
    Fimber.e('Error : $err');
    switch (err.type) {
      case DioErrorType.cancel:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.connectionTimeout:
        err.error = 'errorConnectingToServer';
        break;
      case DioErrorType.unknown:
        err.error = 'errorProcessingYourRequest';
        break;
      case DioErrorType.badResponse:
        if (err.response?.data != null) {
          if (err.response?.data is String) {
            err.error = '${err.response?.statusCode}: ${err.response?.data}';
          } else {
            try {
              // errors object is available
              ErrorsModel errorObj = ErrorsModel.fromJson(err.response?.data);

              if (errorObj.data != null) {
                err.error = '${errorObj.data?.msg}';
              } else {
                //top level message key
                err.error = err.response?.data['message'];
              }
            } catch (e) {
              Fimber.e('Error : $e');
            }
          }

          if (err.response?.statusCode == 404 && err.response!.data is String) {
            err.error = '${err.response?.statusCode} ${"pageNotFound"}';
          }
          if (err.response?.statusCode == 500) {
            err.error = 'internalSeverError';
          }
          if (err.response?.statusCode == 403 ||
              err.response?.statusCode == 401) {
            return await _requestNewToken(err);
          }
          if ((err.response?.statusCode ?? 501) >= 501) {
            err.error = 'badGetWayError';
          }
        } else {
          err.error = 'errorProcessingYourRequest';
        }
        break;
      default:
    }
    return super.onError(err, errorInterceptorHandler);
  }

  // Request new token
  // ignore: missing_return
  Future<Response?> _requestNewToken(DioError error) async {
    /* handles multiple requests */

    var rAccToken = await sharedHelper.isAccessTokenRefreshed();
    if (rAccToken) {
      var options = error.requestOptions;
      var accessToken = await sharedHelper.getAccessToken();
      options.headers['authorization'] = accessToken;

      return await dio.request(options.path, options: options.data);
    }

    _toggleLocks(true);

    /* fetch new token using the refresh token */
    final refreshToken = await sharedHelper.getRefreshToken();
    Fimber.i('Requesting new token with: $refreshToken');

    try {
      var refreshTokenResponse = await dio.post(EndPoints.refreshToken.url,
          data: {'refresh_token': refreshToken});
      if (refreshTokenResponse.statusCode == 200) {
        /* save token  */
        var accessToken =
            (refreshTokenResponse.data as String).replaceAll('\n', '').trim();

        await sharedHelper.saveAccessToken(accessToken);

        /* set it to header */
        var options = error.requestOptions;
        options.headers['authorization'] = accessToken;

        /* proceed with request */
        _toggleLocks(false);

        return await dio.request(options.path, options: options.data);
      } else {
        await _logOut(error);
      }
    } on DioError catch (e) {
      Fimber.e('Error requesting new token ->$e');
      await _logOut(error);
    }
    return null;
  }

  Future<void> _logOut(error) async {
    _toggleLocks(false);
    // await navigationService.logOutUser();
  }

  void _toggleLocks(bool shouldLock) {
    if (shouldLock) {
      dio.close();
    }
  }
}
