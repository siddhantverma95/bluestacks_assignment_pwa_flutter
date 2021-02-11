import 'package:bluestack_assignment_pwa_flutter/repository/repository.dart';
import 'package:flutter/material.dart';

class LocalizationViewModel {
  Locale _appLocale = Locale('en');

  Locale get appLocal => _appLocale ?? Locale("en");

  Repository repo = Repository.instance;

  fetchLocale() async {
    if (await repo.cacheHelper.getLocale() == null) {
      _appLocale = Locale('en');
      return Null;
    }
    _appLocale = Locale(await repo.cacheHelper.getLocale());
    return Null;
  }

  void changeLanguage(Locale type) async {
    if (_appLocale == type) {
      print("HERE");
      return;
    }
    if (type == Locale("ja")) {
      _appLocale = Locale("ja");
      await repo.cacheHelper.saveLocale('ja');
      await repo.cacheHelper.saveLanguage('JP');
    } else {
      _appLocale = Locale("en");
      await repo.cacheHelper.saveLocale('en');
      await repo.cacheHelper.saveLanguage('US');
    }
  }
}
