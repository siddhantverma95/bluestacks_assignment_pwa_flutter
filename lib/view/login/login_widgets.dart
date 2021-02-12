import 'package:bluestack_assignment_pwa_flutter/core/app_stateful_widget.dart';
import 'package:bluestack_assignment_pwa_flutter/core/app_stateless_widget.dart';
import 'package:bluestack_assignment_pwa_flutter/core/routes.dart';
import 'package:bluestack_assignment_pwa_flutter/viewModel/localization_view_model.dart';
import 'package:bluestack_assignment_pwa_flutter/viewModel/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RiveAnimWidget extends AppStatefulWidget {
  RiveAnimWidget({Key key}) : super(key: key);

  @override
  _RiveAnimWidgetState createState() => _RiveAnimWidgetState();
}

class _RiveAnimWidgetState extends AppStatefulWidgetState<RiveAnimWidget> {
  RiveAnimationController _controller;

  @override
  void onInit() {
    _controller = SimpleAnimation('idle');
    super.onInit();
  }

  @override
  Widget setView(BuildContext context) {
    return StateBuilder<LoginViewModel>(
      observe: () => RM.get<LoginViewModel>()
        ..setState((s) => s.loadRiveArtboard(_controller)),
      builder: (context, model) {
        if (model.connectionState == ConnectionState.done) {
          return Container(
              width: double.infinity,
              height: 180.height,
              child: Rive(
                artboard: model.state.getRiveArtboard,
                fit: BoxFit.cover,
              ));
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class LoginFormWidget extends AppStatefulWidget {
  LoginFormWidget({Key key}) : super(key: key);

  @override
  _LoginFormWidgetState createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends AppStatefulWidgetState<LoginFormWidget> {
  TextEditingController _username;
  TextEditingController _password;

  @override
  void onInit() {
    super.onInit();
    _username = TextEditingController();
    _password = TextEditingController();
  }

  @override
  Widget setView(BuildContext context) {
    return StateBuilder<LoginViewModel>(
      observe: () => RM.get<LoginViewModel>(),
      builder: (context, model) => Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            '${imagePath}img_logo.png',
            height: 40.height,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 32.width, vertical: 4.height),
                child: TextFormField(
                  controller: _username,
                  autovalidate: model.state.getUserAutoValidate,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      hintText: '${getString('username')}',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      )),
                  onChanged: (text) {
                    model.setState((s) => s.validateUsername(text));
                  },
                  validator: (text) {
                    if (!model.state.getUsername)
                      return '${getString('username_val')}';
                    else
                      return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 32.width, vertical: 4.height),
                child: TextFormField(
                  controller: _password,
                  autovalidate: model.state.getPasswordAutoValidate,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.grey.shade400),
                      hintText: '${getString('password')}',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      )),
                  obscureText: true,
                  onChanged: (text) {
                    model.setState((s) => s.validatePassword(text));
                  },
                  validator: (text) {
                    if (!model.state.getPassword)
                      return '${getString('password_val')}';
                    else
                      return null;
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.height,
          ),
          Container(
            width: 640.width / 1.3,
            child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 8.height),
                color: appColors.accentColor,
                onPressed: model.state.enableSubmitButton
                    ? () {
                        model.setState(
                            (s) => s
                                    .onSubmitButton(
                                        _username.text, _password.text)
                                    .then((value) {
                                  if (value) {
                                    Navigator.pushReplacementNamed(
                                        context, Screen.home.toString());
                                  } else {
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      content:
                                          Text('${getString('invalid_up')}'),
                                    ));
                                  }
                                }),
                            onError: (context, error) {});
                      }
                    : null,
                child: Text(
                  '${getString('login')}'.toUpperCase(),
                  style: textTheme.s22w600
                      .copyWith(color: appColors.primaryTextColor),
                )),
          )
        ],
      ),
    );
  }
}

class SignInBarWidget extends AppStatefulWidget {
  @override
  _SignInBarWidgetState createState() => _SignInBarWidgetState();
}

class _SignInBarWidgetState extends AppStatefulWidgetState<SignInBarWidget> {
  @override
  Widget setView(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.fontSize),
      color: appColors.accentColor.withOpacity(.4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              '${getString('sign_in')}',
              style:
                  textTheme.s26w700.copyWith(color: appColors.primaryTextColor),
            ),
          ),
          Flexible(
            child: LangToggle(),
          )
        ],
      ),
    );
  }
}

class LangToggle extends StatelessWidget {
  const LangToggle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateBuilder<LocalizationViewModel>(
      observe: () =>
          RM.get<LocalizationViewModel>()..setState((s) => s.appLocal),
      builder: (context, model) => ToggleSwitch(
        initialLabelIndex: model.state.appLocal == Locale('en') ? 0 : 1,
        labels: ['EN', 'JP'],
        activeFgColor: Colors.black,
        fontSize: 14.fontSize,
        onToggle: (index) {
          model.setState((s) =>
              s.changeLanguage(index == 0 ? Locale('en') : Locale('ja')));
        },
      ),
    );
  }
}
