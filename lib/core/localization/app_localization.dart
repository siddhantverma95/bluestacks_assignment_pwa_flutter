import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

class AppLocalization {
  AppLocalization(this.locale);

  final Locale locale;

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'hello-world': 'Hello world!',
      'tournaments': 'Tournaments',
      'played': 'played',
      'won': 'won',
      'winning': 'Winning',
      'percentage': 'percentage',
      'recommended': 'Recommended For You',
      'rating': 'Elo rating',
      'sign_in': 'Sign In',
      'login': 'Login',
      'invalid_up': 'Invalid username and password.',
      'username': 'Username',
      'username_val': 'Username length should be between 3 and 10',
      'password': 'Password',
      'password_val': 'Password length should be between 3 and 10'
    },
    'ja': {
      'hello-world': 'こんにちは世界',
      'tournaments': 'プレーしたトーナメント',
      'played': 'プレイした',
      'won': '勝った',
      'winning': '勝つ',
      'percentage': 'パーセンテージ',
      'recommended': 'あなたにおすすめ',
      'rating': 'これが評価です',
      'sign_in': 'ログイン',
      'login': 'ログイン',
      'invalid_up': 'ユーザー名とパスワードが無効です。',
      'username': 'ユーザー名',
      'username_val': 'ユーザー名の長さは3から10の間でなければなりません',
      'password': 'パスワード',
      'password_val': 'パスワードの長さは3から10の間でなければなりません'
    }
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode][key] ?? '** $key not found';
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ja'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture<AppLocalization>(
      AppLocalization(locale),
    );
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
}
