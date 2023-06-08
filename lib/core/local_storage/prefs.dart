import 'package:shared_preferences/shared_preferences.dart';

import '../di/injector.dart';

class Prefs {
  /* prefs keys */
  static const headers = 'headers';
  static const accessToken = 'access_tokens';
  static const refreshToken = 'refresh_tokens';
  static const refreshedAccessToken = 'refresh_access_tokens';

  Future<SharedPreferences> getInstance() async {
    await inject.allReady();
    return inject.get<SharedPreferences>();
  }

/* save tokens */
  Future saveTokens(String refreshToken, String accessToken) async {
    await (await getInstance()).setString(accessToken, accessToken);
    await (await getInstance()).setString(refreshToken, refreshToken);
  }

  /* save access token */
  Future saveAccessToken(String accessToken) async {
    await (await getInstance()).setBool(accessToken, true);
    await (await getInstance()).setString(refreshToken, accessToken);
  }

/* get access tokens */
  Future<String?> getAccessToken() async =>
      (await getInstance()).getString(accessToken);

  Future<String?> getRefreshToken() async =>
      (await getInstance()).getString(refreshToken);

  Future clearKey(String key) async => (await getInstance()).remove(key);

  Future setHeaders(String encodedHeader) async {
    await (await getInstance()).setString(headers, encodedHeader);
  }

  Future<bool> isAccessTokenRefreshed() async =>
      (await getInstance()).getBool(refreshedAccessToken) ?? false;

/* get encoded header */
  Future<String?> getHeaders() async {
    return (await getInstance()).getString(headers);
  }

  Future saveString(String key, String value) async {
    return await (await getInstance()).setString(key, value);
  }

  Future getString(String key) async {
    var instance = await getInstance();
    return instance.getString(key);
  }

  Future clearStorage() async {
    await (await getInstance()).clear();
  }
}
