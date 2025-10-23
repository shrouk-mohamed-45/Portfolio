import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:portofolio/bloc_observer.dart';
import 'package:portofolio/core/dependency_injection/service_locator.dart' as di;
import 'app.dart';


void main() async{
  Bloc.observer = AppBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection
  //await di.sl();

  runApp(const MyApp());
}


