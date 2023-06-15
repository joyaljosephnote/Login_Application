import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login_application/main.dart';
import 'package:login_application/screens/home.dart';
import 'package:login_application/screens/login_page.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  // checkUserLoggedIn();
  Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const LoginPage(),
    ));
  }

  @override
  void initState() {
    super.initState();
    checkUserLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/dark-background.png",
          height: 200,
        ),
      ),
    );
  }

  Future<void> checkUserLoggedIn() async {
    // ignore: no_leading_underscores_for_local_identifiers
    final _sharedPrefs = await SharedPreferences.getInstance();
    // ignore: no_leading_underscores_for_local_identifiers
    final _userLoggedIn = _sharedPrefs.getBool(SAVE_KEY_NAME) ?? false;
    if (_userLoggedIn == false) {
      gotoLogin();
    } else {
      await Future.delayed(const Duration(seconds: 3));
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const HomeScreen(),
        ),
      );
    }
  }
}
