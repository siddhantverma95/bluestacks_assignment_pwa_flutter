import 'package:flutter/material.dart';

abstract class AppStatelessWidget extends StatelessWidget {
  final String imagePath = "lib/resources/images/";

  AppStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: setView(context));
  }

  Widget setView(BuildContext context);
}
