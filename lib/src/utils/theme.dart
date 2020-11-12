/*
import 'package:flutter/material.dart';

import 'colors.dart';

final ThemeData kCraneTheme = _buildCraneTheme();

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: kCranePrimaryWhite);
}

ThemeData _buildCraneTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    colorScheme: ColorScheme.light().copyWith(
      primary: kCranePurple800,
      secondary: kCraneRed700,
    ),
    accentColor: kCranePurple700,
    primaryColor: kCranePurple800,
    buttonColor: kCraneRed700,
    hintColor: kCranePrimaryWhite,
    indicatorColor: kCranePrimaryWhite,
    scaffoldBackgroundColor: kCranePrimaryWhite,
    cardColor: kCranePrimaryWhite,
    textSelectionColor: kCranePurple700,
    errorColor: kCraneErrorOrange,
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.accent,
    ),
    textTheme: _buildCraneTextTheme(base.textTheme),
    primaryTextTheme: _buildCraneTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildCraneTextTheme(base.accentTextTheme),
    iconTheme: _customIconTheme(base.iconTheme),
  );
}

TextTheme _buildCraneTextTheme(TextTheme base) {
  return base.copyWith(
    headline1: base.headline1.copyWith(
      fontWeight: FontWeight.w200,
      fontSize: 96.0,
    ),
    headline2: base.headline2.copyWith(
      fontWeight: FontWeight.w300,
      fontSize: 60.0,
    ),
    headline3: base.headline3.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 48.0,
    ),
    headline4: base.headline4.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 34.0,
    ),
    headline5: base.headline5.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 24.0
    ),
    headline6: base.headline6.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 20.0,
    ),
    subtitle1: base.subtitle1.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
      letterSpacing: 0.5,
    ),
    subtitle2: base.subtitle2.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 14.0,
      color: kCraneGrey,
    ),
    bodyText1: base.bodyText1.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 16.0,
    ),
    bodyText2: base.bodyText2.copyWith(
      fontWeight: FontWeight.w300,
      fontSize: 14.0,
    ),
    button: base.button.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 14.0,
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 12.0,
      color: kCraneGrey,
    ),
    overline: base.overline.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 12.0,
    ),
  ).apply(
    fontFamily: 'Raleway',
  );
}*/