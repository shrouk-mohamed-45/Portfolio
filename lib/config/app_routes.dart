import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../features/portfolio/presentation/pages/home_screen.dart';

class Routes{
static const String initialRoute = '/';
static const String homeScreen = '/home_screen';
}

class AppRoutes{
  static Route? onGenerateRoutes(RouteSettings routeSettings){

    switch(routeSettings.name){
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (context) => HomeScreen()
        );

    // ─────────────── default ─────────────────
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("404 - Route Not Found")),
          ),
        );
    }
  }
}