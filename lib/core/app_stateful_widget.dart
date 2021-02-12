import 'package:bluestack_assignment_pwa_flutter/core/localization/app_localization.dart';
import 'package:bluestack_assignment_pwa_flutter/resources/colors.dart';
import 'package:bluestack_assignment_pwa_flutter/resources/text_style.dart';
import 'package:flutter/material.dart';
export 'adaptive/adaptive.dart';

class StatefulWrapper extends StatefulWidget {
  final Function onInit;
  final Widget child;
  const StatefulWrapper({@required this.onInit, @required this.child});
  @override
  _StatefulWrapperState createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWrapper> {
  @override
  void initState() {
    if (widget.onInit != null) {
      widget.onInit();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

abstract class AppStatefulWidget extends StatefulWidget {
  AppStatefulWidget({Key key}) : super(key: key);
}

abstract class AppStatefulWidgetState<WIDGET extends AppStatefulWidget>
    extends State<WIDGET> {
  final String imagePath = "lib/resources/images/";

  AppColors get appColors => AppColorImpl();

  AppTextStyle get textTheme => DarkTextStyle(appColors);

  @override
  void initState() {
    super.initState();
    if (onInit != null) {
      onInit();
    }
  }

  @override
  Widget build(BuildContext context) {
    return setView(context);
  }

  String getString(String key) {
    return AppLocalization.of(context).translate(key);
  }

  Widget setView(BuildContext context);

  void onInit() {}
}
