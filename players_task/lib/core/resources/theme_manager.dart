import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:players_task/core/resources/colors_manager.dart';
import 'package:players_task/core/resources/values_manager.dart';

MaterialColor buildMaterialColor(Color color) {
  List<double> strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red;
  final int g = color.green;
  final int b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  for (int i = 0; i < strengths.length; i++) {
    double strength = strengths[i];
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

ThemeData getApplicationTheme({required bool isLight}) {
  if(isLight) {
    return _getApplicationThemeLight();
  }
  else {
    return _getApplicationThemeDark();
  }
}

ThemeData _getApplicationThemeLight() {
  return ThemeData(
    // Main Colors
    primarySwatch: buildMaterialColor(ColorsManager.primaryColor),
    scaffoldBackgroundColor: ColorsManager.white,

    // AppBar Theme
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: ColorsManager.white, statusBarIconBrightness: Brightness.dark),
      backgroundColor: ColorsManager.white,
      elevation: SizeManager.s0,
      titleTextStyle: TextStyle(
        color: ColorsManager.black,
        fontSize: SizeManager.s16,
      ),
    ),
  );
}

ThemeData _getApplicationThemeDark() {
  return ThemeData(
    // Main Colors
    primarySwatch: buildMaterialColor(ColorsManager.primaryColor),
    scaffoldBackgroundColor: ColorsManager.secondaryDarkColor,

    // AppBar Theme
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: ColorsManager.secondaryDarkColor, statusBarIconBrightness: Brightness.light),
      backgroundColor: ColorsManager.secondaryDarkColor,
      elevation: SizeManager.s0,
      titleTextStyle: TextStyle(
        color: ColorsManager.white,
        fontSize: SizeManager.s16,
      ),
    ),
  );
}