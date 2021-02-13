import 'package:bluestack_assignment_pwa_flutter/core/rest_client.dart';
import 'package:sprintf/sprintf.dart';

enum ApiEnvironment { loginUserApi, recommendedApi }

class ApiEndPoints {
  static final String loginUserEndpoint =
      'https://0f6fec95-2ecf-4470-9720-956c15f4fd29.mock.pstmn.io/';
  static final String recommendedEndpoint =
      "https://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/";

  //apis
  static final String tournamentApi =
      '${recommendedEndpoint}tournaments_list_v2?limit=%d&status=%s&cursor=%s';
  static final String userDetailApi = '${loginUserEndpoint}user';
}

abstract class ApiHelper {
  Future<dynamic> executeTournaments(int limit, String status, String cursor);
  Future<dynamic> executeUserDetails();
}

class ApiHelperImpl extends ApiHelper {
  final RestClient _api;

  ApiHelperImpl(this._api);

  @override
  Future executeTournaments(int limit, String status, String cursor) {
    return _api
        .get(sprintf(ApiEndPoints.tournamentApi, [limit, status, cursor]))
        .then((value) => value.data);
  }

  @override
  Future executeUserDetails() {
    return _api.get(ApiEndPoints.userDetailApi).then((value) => value.data);
  }
}
