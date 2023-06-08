// ignore_for_file: constant_identifier_names, unused_local_variable

import 'package:shared_preferences/shared_preferences.dart';

import '../di/injector.dart';

const String refreshTokenKey = 'refreshToken';
const String accessTokenKey = 'accessTokenKey';
const String saveUserIdKey = 'saveUserIdKey';

const refreshed_access_token = 'refreshed_access_tokens';
const String freshchat_token_responseKey = 'freshchat_token_responseKey';
const String langKey = 'lang_support_key';
const String statusKey = 'status_key';
const String serviceTypeKey = 'service_type_key';

abstract class SharedHelper {
  Future<SharedPreferences> getInstance();
  Future<bool> saveString(String key, String value);
  Future<bool> saveBool(String key, bool value);
  Future<String?> getString(String key);
  Future<bool> clearStorage();
  Future saveTokens({String? accessToken, String? refreshToken});
  Future<bool> isAccessTokenRefreshed();
  Future clearKey(String key);
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future saveAccessToken(String accessToken);
  Future saveUserId(String userId);
  Future<String?> getUserId();
  Future getDriverStatus();
  Future saveDriverStatus(bool status);
  // Future<Driver?> getDriverDetailsData();
}

class SharedHelperImpl extends SharedHelper {
  final SharedPreferences sharedPreferences;

  SharedHelperImpl({required this.sharedPreferences});

  @override
  Future<SharedPreferences> getInstance() async {
    await inject.allReady();
    return inject.get<SharedPreferences>();
  }

  @override
  Future<bool> saveString(String key, String value) async {
    return sharedPreferences.setString(key, value);
  }

  @override
  Future<bool> saveBool(String key, bool value) async {
    return sharedPreferences.setBool(key, value);
  }

  @override
  Future<String?> getString(String key) async {
    return sharedPreferences.getString(key);
  }

  @override
  Future<bool> clearStorage() async {
    return await sharedPreferences.clear();
  }

  @override
  Future saveTokens({String? accessToken, String? refreshToken}) async {
    await sharedPreferences.setString(refreshTokenKey, refreshToken!);
    await sharedPreferences.setString(accessTokenKey, accessToken!);

    var acc = await getAccessToken();
    var ref = await getRefreshToken();
  }

  @override
  Future<bool> isAccessTokenRefreshed() async =>
      (sharedPreferences).getBool(refreshed_access_token) ?? false;

  @override
  Future clearKey(String key) async => (sharedPreferences).remove(key);

  @override
  Future<String?> getAccessToken() async {
    return sharedPreferences.getString(accessTokenKey);
  }

  @override
  Future<String?> getRefreshToken() async {
    return sharedPreferences.getString(refreshTokenKey);
  }

  /* save access token */
  @override
  Future saveAccessToken(String accessToken) async {
    await (sharedPreferences).setBool(refreshed_access_token, true);
    await (sharedPreferences).setString(accessTokenKey, accessToken);
  }

  /* save user id */
  @override
  Future saveUserId(String userId) async {
    await (sharedPreferences).setString(saveUserIdKey, userId);
  }

  @override
  Future<String?> getUserId() async {
    return sharedPreferences.getString(saveUserIdKey);
  }

  // @override
  // Future<Driver?> getDriverDetailsData() async {
  //   if (sharedPreferences.containsKey(driverDetailsDataKey)) {
  //     final data =
  //         jsonDecode(sharedPreferences.getString(driverDetailsDataKey)!);
  //     return Driver.fromJson(data);
  //   } else {
  //     return null;
  //   }
  // }

  @override
  Future saveDriverStatus(bool status) async {
    return sharedPreferences.setBool(statusKey, status);
  }

  @override
  Future<bool> getDriverStatus() async {
    return sharedPreferences.getBool(statusKey) ?? true;
  }
}
