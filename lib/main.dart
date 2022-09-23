import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Removes varying colors on the status bar
    // SystemChrome.setSystemUIOverlayStyle(
    //     const SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,  // Removes Debug text
      title: 'My ToDo App',
      home: Home(),
    );
  }
}
