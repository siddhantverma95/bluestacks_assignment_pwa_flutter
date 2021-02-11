import 'package:bluestack_assignment_pwa_flutter/core/cache_client.dart';
import 'package:bluestack_assignment_pwa_flutter/core/rest_client.dart';
import 'package:bluestack_assignment_pwa_flutter/repository/network/api_helper.dart';

import 'cache/cache_helper.dart';

abstract class RepositoryInterface {
  ApiHelper get apiHelper;

  CacheHelper get cacheHelper;
}

class Repository implements RepositoryInterface {
  static final Repository _singleton = Repository._internal();

  ApiHelper _apiHelper;
  CacheHelper _cacheHelper;

  Repository._internal() {
    _apiHelper = ApiHelperImpl(RestClient());
    _cacheHelper = CacheHelperImpl(CacheClient());
  }

  static Repository get instance => _singleton;

  @override
  ApiHelper get apiHelper => _apiHelper;

  @override
  CacheHelper get cacheHelper => _cacheHelper;
}
