import 'package:bluestack_assignment_pwa_flutter/viewModel/home_view_model.dart';
import 'package:bluestack_assignment_pwa_flutter/viewModel/localization_view_model.dart';
import 'package:bluestack_assignment_pwa_flutter/viewModel/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'core/adaptive/app_adaptive_dimensions.dart';
import 'core/localization/app_localization.dart';
import 'core/routes.dart' as _routes;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector(
        inject: [
          Inject(() => LocalizationViewModel()),
          Inject(() => HomeViewModel()),
          Inject(() => LoginViewModel())
        ],
        builder: (context) {
          RM.get<LocalizationViewModel>().state.fetchLocale();
          return LayoutBuilder(builder: (context, constraints) {
            return OrientationBuilder(builder: (context, orientation) {
              SizeConfig(designScreenWidth: 640, designScreenHeight: 360)
                  .init(constraints, orientation);
              return StateBuilder<LocalizationViewModel>(
                observe: () => RM.get<LocalizationViewModel>(),
                builder: (context, model) => MaterialApp(
                  localizationsDelegates: [
                    const AppLocalizationDelegate(),
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate
                  ],
                  locale: RM.get<LocalizationViewModel>().state.appLocal,
                  supportedLocales: [
                    const Locale('en'),
                    const Locale('ja'),
                  ],
                  title: 'Flyingwolf',
                  theme: ThemeData(
                    primaryColor: Colors.white,
                  ),
                  onGenerateRoute: _routes.Router.generateRoute,
                  initialRoute: _routes.Screen.home.toString(),
                ),
              );
            });
          });
        });
  }
}
