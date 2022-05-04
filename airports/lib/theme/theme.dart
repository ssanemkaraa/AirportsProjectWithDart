import 'package:airports/constants/constants.dart';
import 'package:airports/theme/colors.dart';
import 'package:airports/theme/generatematerialcolor.dart';
import 'package:flutter/material.dart';

ThemeData projectThemeData() {
  return ThemeData(
    primarySwatch: generateMaterialColor(ColorPaletteSoftGreen.a_tumbleweed),
    primaryColor: ColorPaletteSoftGreen.c_darkseegreen,
    primaryColorDark: ColorPaletteSoftGreen.e_darkspringgreen,
    primaryColorLight: ColorPaletteSoftGreen.b_ashgrey,
    appBarTheme:
        const AppBarTheme(backgroundColor: ColorPaletteSoftGreen.a_tumbleweed),
  );
}
