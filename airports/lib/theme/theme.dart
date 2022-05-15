import 'package:airports/theme/colors.dart';
import 'package:airports/theme/generatematerialcolor.dart';
import 'package:flutter/material.dart';

ThemeData projectThemeData() {
  return ThemeData(
    primarySwatch: generateMaterialColor(ColorPaletteSoftGreen.aTumbleweed),
    primaryColor: ColorPaletteSoftGreen.cDarkseegreen,
    primaryColorDark: ColorPaletteSoftGreen.eDarkspringgreen,
    primaryColorLight: ColorPaletteSoftGreen.bAshgrey,
    appBarTheme:
        const AppBarTheme(backgroundColor: ColorPaletteSoftGreen.aTumbleweed),
  );
}
