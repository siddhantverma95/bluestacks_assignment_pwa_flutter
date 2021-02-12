import 'package:bluestack_assignment_pwa_flutter/resources/colors.dart';
import 'package:bluestack_assignment_pwa_flutter/resources/text_style.dart';
import 'package:flutter/material.dart';
export 'adaptive/adaptive.dart';

abstract class AppStatelessWidget extends StatelessWidget {
  final String imagePath = "lib/resources/images/";

  AppColors get appColors => AppColorImpl();

  AppTextStyle get textTheme => DarkTextStyle(appColors);

  AppStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return setView(context);
  }

  Widget setView(BuildContext context);
}
