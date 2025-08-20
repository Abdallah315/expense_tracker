import 'package:flutter/material.dart';
import 'package:inovola_task/core/theming/colors.dart';
import 'package:inovola_task/core/theming/styles.dart';

class AppTheme {
  static AppTheme instance = AppTheme._();

  AppTheme._();

  ThemeData getTheme() => ThemeData(
    primaryColor: ColorsManager.primary,
    colorScheme: ColorScheme.fromSeed(seedColor: ColorsManager.primary),
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorsManager.background,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.primary,
      foregroundColor: ColorsManager.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.white,
      elevation: 0,
      titleTextStyle: TextStyles.font16MediumBlack,
      centerTitle: true,
      iconTheme: IconThemeData(color: ColorsManager.black),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorsManager.primary,
      selectionColor: ColorsManager.primary.withAlpha(30),
      selectionHandleColor: ColorsManager.primary,
    ),
  );
}
