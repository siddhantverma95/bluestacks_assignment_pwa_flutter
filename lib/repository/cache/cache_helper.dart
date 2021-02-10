import 'dart:collection';

import 'package:bluestack_assignment_pwa_flutter/core/cache_client.dart';

abstract class CacheKeys {
  static const String TOKEN = "token";
  static const String USER_DATA = "userData";
}

abstract class CacheHelper {
  Future<String> getAccessToken();

  Future<String> getUserData();

  Future saveAccessToken(String token);

  Future saveUserData(String userId);
}

class CacheHelperImpl extends CacheHelper {
  final CacheClient _cache;

  CacheHelperImpl(this._cache);

  @override
  Future<String> getAccessToken() {
    return _cache.getString(CacheKeys.TOKEN);
  }

  @override
  Future<String> getUserData() {
    // TODO: implement getUserData
    throw UnimplementedError();
  }

  @override
  Future saveAccessToken(String token) {
    return _cache.putString(CacheKeys.TOKEN, token);
  }

  @override
  Future saveUserData(String userId) {
    // TODO: implement saveUserData
    throw UnimplementedError();
  }
}
