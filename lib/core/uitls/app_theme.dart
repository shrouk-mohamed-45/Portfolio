import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme{
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.secondaryColor,
      foregroundColor: Colors.white,
    //   elevation: 0,
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.secondaryColor,
    appBarTheme:  AppBarTheme(
      backgroundColor: AppColors.secondaryColor,
      foregroundColor: Colors.white,
    //   elevation: 0,
    ),
  );
}