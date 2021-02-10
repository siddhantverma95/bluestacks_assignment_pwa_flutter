import 'package:bluestack_assignment_pwa_flutter/model/tournaments.dart';
import 'package:bluestack_assignment_pwa_flutter/repository/repository.dart';

class HomeViewModel {
  Repository repo = Repository.instance;

  Tournaments _tournaments;

  Tournaments get getTournaments => _tournaments;

  Future<void> fetchTournaments() async {
    await repo.apiHelper.executeTournaments(10, "all", "").then((value) {
      _tournaments = Tournaments.fromJson(value);
    }).catchError((error) {
      print("Error: $error");
    });
  }
}
