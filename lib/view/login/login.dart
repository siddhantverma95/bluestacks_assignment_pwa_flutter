import 'package:bluestack_assignment_pwa_flutter/core/app_stateful_widget.dart';
import 'package:bluestack_assignment_pwa_flutter/core/app_stateless_widget.dart';
import 'package:bluestack_assignment_pwa_flutter/core/routes.dart';
import 'package:bluestack_assignment_pwa_flutter/view/login/login_widgets.dart';
import 'package:bluestack_assignment_pwa_flutter/viewModel/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class Login extends AppStatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends AppStatefulWidgetState<Login> {
  @override
  void onInit() {
    RM.get<LoginViewModel>().state.getLoggedIn().then((value) {
      if (value) {
        Navigator.pushReplacementNamed(context, Screen.home.toString());
      }
    });
    super.onInit();
  }

  @override
  Widget setView(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _getLoginMobile(),
      tablet: _getLoginMobile(),
      desktop: _getLoginDesktop(),
    );
  }

  Widget _getLoginDesktop() {
    return Scaffold(
      body: Center(
        child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.fontSize)),
              margin: EdgeInsets.symmetric(
                  horizontal: 70.width, vertical: 20.height),
              elevation: 8,
              child: Row(
                children: [
                  Expanded(flex: 1, child: RiveAnimWidget()),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SignInBarWidget(),
                        Expanded(
                          child: LoginFormWidget(),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

  Widget _getLoginMobile() {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: 348.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                RiveAnimWidget(),
                SignInBarWidget(),
                Expanded(
                  child: LoginFormWidget(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
