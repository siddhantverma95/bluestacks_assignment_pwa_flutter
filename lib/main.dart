import 'package:bluestack_assignment_pwa_flutter/viewModel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'core/routes.dart' as _routes;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
        inject: [Inject(() => HomeViewModel())],
        builder: (context) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            onGenerateRoute: _routes.Router.generateRoute,
            initialRoute: _routes.Screen.home.toString(),
          );
        });
  }
}
