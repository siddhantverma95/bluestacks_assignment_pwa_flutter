import 'package:bluestack_assignment_pwa_flutter/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:bluestack_assignment_pwa_flutter/core/app_stateless_widget.dart';

abstract class AppTextStyle {
  TextStyle get s10w400;

  TextStyle get s10w500;

  TextStyle get s10w600;

  TextStyle get s10w700;

  TextStyle get s12w400;

  TextStyle get s12w500;

  TextStyle get s12w600;

  TextStyle get s12w700;

  TextStyle get s14w400;

  TextStyle get s14w500;

  TextStyle get s14w600;

  TextStyle get s14w700;

  TextStyle get s16w400;

  TextStyle get s16w500;

  TextStyle get s16w600;

  TextStyle get s16w700;

  TextStyle get s18w400;

  TextStyle get s18w500;

  TextStyle get s18w600;

  TextStyle get s18w700;

  TextStyle get s20w400;

  TextStyle get s20w500;

  TextStyle get s20w600;

  TextStyle get s20w700;

  TextStyle get s22w400;

  TextStyle get s22w500;

  TextStyle get s22w600;

  TextStyle get s22w700;

  TextStyle get s24w400;

  TextStyle get s24w500;

  TextStyle get s24w600;

  TextStyle get s24w700;

  TextStyle get s26w400;

  TextStyle get s26w500;

  TextStyle get s26w600;

  TextStyle get s26w700;

  TextStyle get s28w400;

  TextStyle get s28w500;

  TextStyle get s28w600;

  TextStyle get s28w700;

  TextStyle get s30w400;

  TextStyle get s30w500;

  TextStyle get s30w600;

  TextStyle get s30w700;

  TextStyle get s32w400;

  TextStyle get s32w500;

  TextStyle get s32w600;

  TextStyle get s32w700;
}

class DarkTextStyle extends AppTextStyle {
  DarkTextStyle(AppColors colors);

  @override
  TextStyle get s10w400 =>
      TextStyle(fontWeight: FontWeight.w400, fontSize: 10.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s10w500 =>
      TextStyle(fontWeight: FontWeight.w500, fontSize: 10.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s10w600 =>
      TextStyle(fontWeight: FontWeight.w600, fontSize: 10.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s10w700 =>
      TextStyle(fontWeight: FontWeight.w700, fontSize: 10.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s12w400 =>
      TextStyle(fontWeight: FontWeight.w400, fontSize: 12.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s12w500 =>
      TextStyle(fontWeight: FontWeight.w500, fontSize: 12.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s12w600 =>
      TextStyle(fontWeight: FontWeight.w600, fontSize: 12.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s12w700 =>
      TextStyle(fontWeight: FontWeight.w700, fontSize: 12.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s14w400 =>
      TextStyle(fontWeight: FontWeight.w400, fontSize: 14.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s14w500 =>
      TextStyle(fontWeight: FontWeight.w500, fontSize: 14.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s14w600 =>
      TextStyle(fontWeight: FontWeight.w600, fontSize: 14.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s14w700 =>
      TextStyle(fontWeight: FontWeight.w700, fontSize: 14.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s16w400 =>
      TextStyle(fontWeight: FontWeight.w400, fontSize: 16.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s16w500 =>
      TextStyle(fontWeight: FontWeight.w500, fontSize: 16.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s16w600 =>
      TextStyle(fontWeight: FontWeight.w600, fontSize: 16.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s16w700 =>
      TextStyle(fontWeight: FontWeight.w700, fontSize: 16.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s18w400 =>
      TextStyle(fontWeight: FontWeight.w400, fontSize: 18.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s18w500 =>
      TextStyle(fontWeight: FontWeight.w500, fontSize: 18.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s18w600 =>
      TextStyle(fontWeight: FontWeight.w600, fontSize: 18.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s18w700 =>
      TextStyle(fontWeight: FontWeight.w700, fontSize: 18.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s20w400 =>
      TextStyle(fontWeight: FontWeight.w400, fontSize: 20.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s20w500 =>
      TextStyle(fontWeight: FontWeight.w500, fontSize: 20.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s20w600 =>
      TextStyle(fontWeight: FontWeight.w600, fontSize: 20.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s20w700 =>
      TextStyle(fontWeight: FontWeight.w700, fontSize: 20.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s22w400 =>
      TextStyle(fontWeight: FontWeight.w400, fontSize: 22.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s22w500 =>
      TextStyle(fontWeight: FontWeight.w500, fontSize: 22.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s22w600 =>
      TextStyle(fontWeight: FontWeight.w600, fontSize: 22.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s22w700 =>
      TextStyle(fontWeight: FontWeight.w700, fontSize: 22.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s24w400 =>
      TextStyle(fontWeight: FontWeight.w400, fontSize: 24.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s24w500 =>
      TextStyle(fontWeight: FontWeight.w500, fontSize: 24.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s24w600 =>
      TextStyle(fontWeight: FontWeight.w600, fontSize: 24.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s24w700 =>
      TextStyle(fontWeight: FontWeight.w700, fontSize: 24.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s26w400 =>
      TextStyle(fontWeight: FontWeight.w400, fontSize: 26.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s26w500 =>
      TextStyle(fontWeight: FontWeight.w500, fontSize: 26.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s26w600 =>
      TextStyle(fontWeight: FontWeight.w600, fontSize: 26.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s26w700 =>
      TextStyle(fontWeight: FontWeight.w700, fontSize: 26.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s28w400 =>
      TextStyle(fontWeight: FontWeight.w400, fontSize: 28.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s28w500 =>
      TextStyle(fontWeight: FontWeight.w500, fontSize: 28.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s28w600 =>
      TextStyle(fontWeight: FontWeight.w600, fontSize: 28.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s28w700 =>
      TextStyle(fontWeight: FontWeight.w700, fontSize: 28.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s30w400 =>
      TextStyle(fontWeight: FontWeight.w400, fontSize: 30.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s30w500 =>
      TextStyle(fontWeight: FontWeight.w500, fontSize: 30.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s30w600 =>
      TextStyle(fontWeight: FontWeight.w600, fontSize: 30.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s30w700 =>
      TextStyle(fontWeight: FontWeight.w700, fontSize: 30.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s32w400 =>
      TextStyle(fontWeight: FontWeight.w400, fontSize: 32.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s32w500 =>
      TextStyle(fontWeight: FontWeight.w500, fontSize: 32.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s32w600 =>
      TextStyle(fontWeight: FontWeight.w600, fontSize: 32.fontSize)
          .copyWith(color: Colors.black);

  @override
  TextStyle get s32w700 =>
      TextStyle(fontWeight: FontWeight.w700, fontSize: 32.fontSize)
          .copyWith(color: Colors.black);
}
