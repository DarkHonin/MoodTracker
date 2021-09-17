import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mood_tracker/ui/view/home_view.dart';
import 'package:mood_tracker/ui/view/moods_view.dart';
import 'package:mood_tracker/core/dependency_injection.dart';
import 'package:mood_tracker/core/Navigation.dart';

void main() async {
  await DependencyInjection().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Navigation.generateRoute,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}
