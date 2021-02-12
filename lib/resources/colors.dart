import 'package:flutter/material.dart';

abstract class AppColors {
  Color get primaryColor;

  Color get accentColor;

  Color get backgroundColor;

  Color get primaryTextColor;

  Color get accentTextColor;
}

class AppColorImpl extends AppColors {
  @override
  Color get accentColor => Color(0xff4b71fe);

  @override
  Color get accentTextColor => Color(0xfffcc201);

  @override
  Color get backgroundColor => Color(0xff000010);

  @override
  Color get primaryColor => Colors.white;

  @override
  Color get primaryTextColor => Colors.white;
}
