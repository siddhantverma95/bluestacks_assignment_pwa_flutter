import 'package:bluestack_assignment_pwa_flutter/core/app_stateful_widget.dart';
import 'package:bluestack_assignment_pwa_flutter/core/routes.dart';
import 'package:bluestack_assignment_pwa_flutter/view/home/home_widgets.dart';
import 'package:bluestack_assignment_pwa_flutter/viewModel/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class Home extends AppStatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends AppStatefulWidgetState {
  @override
  Widget setView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flyingwolf',
          style: textTheme.s26w600,
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                RM.get<LoginViewModel>().setState((s) => s.onLogout()).then(
                    (value) => Navigator.pushReplacementNamed(
                        context, Screen.login.toString()));
              })
        ],
        elevation: 0,
        leading: Icon(Icons.menu),
      ),
      body: _getResponsiveHome(),
    );
  }

  Widget _getResponsiveHome() {
    return ScreenTypeLayout(
      mobile: _getHomeMobile(),
      tablet: _getHomeTablet(),
      desktop: _getHomeDesktop(),
    );
  }

  Widget _getHomeMobile() {
    return Column(
      children: [
        UserDetailsWidget(),
        Expanded(child: RecommendedCardList()),
      ],
    );
  }

  Widget _getHomeTablet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        UserDetailsWidget(),
        Expanded(child: RecommendedCardList()),
      ],
    );
  }

  Widget _getHomeDesktop() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 2, child: UserDetailsWidget()),
        Expanded(flex: 10, child: RecommendedCardList()),
      ],
    );
  }
}
