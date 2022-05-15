import 'package:airports/constants/constants.dart';
import 'package:airports/theme/theme.dart';
import 'package:airports/views/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ProjectConstants.maintitle,
      theme: projectThemeData(),
      home: const LoginView(),
    );
  }
}
