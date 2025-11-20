import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/bloc_observer.dart';
import 'package:portfolio/core/dependency_injection/service_locator.dart' as di;
import 'app.dart';


void main() async{
  Bloc.observer = AppBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection
  //await di.sl();

  runApp(const MyApp());
}


