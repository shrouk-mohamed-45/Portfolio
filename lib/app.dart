import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portofolio/config/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portofolio/features/portfolio/presentation/pages/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(440, 956),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        initialRoute: Routes.homeScreen,
      ),
    );
  }
}