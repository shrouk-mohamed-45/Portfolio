import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/config/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/uitls/app_colors.dart';
import 'package:portfolio/features/portfolio/presentation/pages/home_screen.dart';

import 'core/uitls/app_theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.dark;

  void toggleTheme() {
    setState(() {
      themeMode =
      themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(440, 956),
      //minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        themeMode: themeMode,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        // theme: ThemeData(
        //   //brightness: Brightness.dark,
        //   scaffoldBackgroundColor: Colors.blue.shade900,
        //   primaryColor: AppColors.secondaryColor,
        //   //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   //useMaterial3: true,
        //   colorScheme: ColorScheme.light(
        //     primary: AppColors.primaryColor,
        //     secondary: AppColors.secondaryColor,
        //   ),
        //
        //   appBarTheme: AppBarTheme(
        //     backgroundColor: AppColors.secondaryColor,
        //     foregroundColor: Colors.white,
        //     centerTitle: true,
        //   ),
        // ),

        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        initialRoute: Routes.homeScreen,
      ),

    );
  }
}