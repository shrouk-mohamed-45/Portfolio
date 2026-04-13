import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'bloc_observer.dart';


void main() async{
  Bloc.observer = AppBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection
  //await di.sl();

  runApp(const MyApp());
}


