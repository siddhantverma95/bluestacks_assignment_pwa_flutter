import 'package:bluestack_assignment_pwa_flutter/core/cache_client.dart';

abstract class CacheKeys {
  static const String LOCALE = "locale";
  static const String LANGUAGE = 'language';
  static const String IS_LOGGED_IN = "is_looged_in";
}

abstract class CacheHelper {
  Future<String> getLocale();

  Future<String> getLanguage();

  Future<bool> getUserData();

  Future saveLocale(String locale);

  Future saveLanguage(String lang);

  Future saveUserData(bool isLoggedIn);
}

class CacheHelperImpl extends CacheHelper {
  final CacheClient _cache;

  CacheHelperImpl(this._cache);

  @override
  Future<String> getLocale() {
    return _cache.getString(CacheKeys.LOCALE);
  }

  @override
  Future<bool> getUserData() {
    return _cache.getBool(CacheKeys.IS_LOGGED_IN);
  }

  @override
  Future saveLocale(String locale) {
    return _cache.putString(CacheKeys.LOCALE, locale);
  }

  @override
  Future saveUserData(bool isLoggedIn) {
    return _cache.putBool(CacheKeys.IS_LOGGED_IN, isLoggedIn);
  }

  @override
  Future<String> getLanguage() {
    return _cache.getString(CacheKeys.LANGUAGE);
  }

  @override
  Future saveLanguage(String lang) {
    return _cache.putString(CacheKeys.LANGUAGE, lang);
  }
}
