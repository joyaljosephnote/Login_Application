import 'package:flutter/material.dart';
import 'package:login_application/screens/splash.dart';

const SAVE_KEY_NAME = "UserLoggedIn";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login Sample Final",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const ScreenSplash(),
    );
  }
}
