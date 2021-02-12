import 'dart:async';

import 'package:bluestack_assignment_pwa_flutter/model/tournaments.dart';
import 'package:bluestack_assignment_pwa_flutter/model/user.dart';
import 'package:bluestack_assignment_pwa_flutter/repository/repository.dart';

class HomeViewModel {
  Repository repo = Repository.instance;

  List<Tournament> _tournaments = List();

  User _userDetails;

  String _lastCursor;

  List<Tournament> get getTournaments => _tournaments;
  User get getUserDetails => _userDetails;

  void fetchTournaments(bool isLoadMore) async {
    if (isLoadMore) {
      await repo.apiHelper
          .executeTournaments(10, "all", _lastCursor)
          .then((value) async {
        var tourObj = Tournaments.fromJson(value);
        _lastCursor = tourObj.data.cursor;
        _tournaments.addAll(tourObj.data.tournaments);
      }).catchError((error) {
        print("Error: $error");
      });
    } else {
      await repo.apiHelper.executeTournaments(10, "all", "").then((value) {
        var tourObj = Tournaments.fromJson(value);
        _lastCursor = tourObj.data.cursor;
        _tournaments.addAll(tourObj.data.tournaments);
      }).catchError((error) {
        print("Error: $error");
      });
    }
  }

  Future<void> fetchUserDetails() async {
    await repo.apiHelper.executeUserDetails().then((value) {
      _userDetails = User.fromJson(value);
    }).catchError((error) {
      print("Error: $error");
    });
  }
}
