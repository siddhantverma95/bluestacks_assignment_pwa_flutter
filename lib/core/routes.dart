import 'package:bluestack_assignment_pwa_flutter/view/home/home.dart';
import 'package:bluestack_assignment_pwa_flutter/view/login/login.dart';
import 'package:flutter/material.dart';

enum Screen { login, home }

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var screen = Screen.values.firstWhere((e) => e.toString() == settings.name);

    switch (screen) {
      case Screen.login:
        return MaterialPageRoute(
          builder: (_) => Login(),
        );

      case Screen.home:
        return MaterialPageRoute(
          builder: (_) => Home(),
        );

      default:
        return FadeRoute(
          page: Home(),
        );
    }
  }
}

class FadeRoute extends PageRouteBuilder {
  final Widget page;

  FadeRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
