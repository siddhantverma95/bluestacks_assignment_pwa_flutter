import 'package:bluestack_assignment_pwa_flutter/core/rest_client.dart';

enum ApiEnvironment { loginUserApi, recommendedApi }

class ApiEndPoints {
  static final String loginUserEndpoint = '';
  static final String recommendedEndpoint =
      "http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/";

  //apis
  static final String tournamentApi = 'tournaments_list_v2?limit=10&status=all';
}

abstract class ApiHelper {
  Future<dynamic> executeTournaments(int limit, String status, String cursor);
}

class ApiHelperImpl extends ApiHelper {
  final RestClient _api;

  ApiHelperImpl(this._api);

  @override
  Future executeTournaments(int limit, String status, String cursor) {
    return _api.get(ApiEndPoints.tournamentApi, {
      "limit": limit,
      "status": status,
      "cursor": cursor
    }).then((value) => value.data);
  }
}
