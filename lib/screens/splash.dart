import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_2/screens/home_screen.dart';
import 'package:weather_app_2/screens/onboard_screen.dart';

// ignore: must_be_immutable
class Splash extends StatefulWidget {
  Splash({super.key});
  bool isHome = false;
  late SharedPreferences prefs;

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => {
              setUp(),
              Navigator.of(context).popUntil((route) => route.isFirst),
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => !widget.isHome
                          ? const Onboarding()
                          : const HomePage()))
            });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: content(),
    );
  }

  Widget content() {
    return Center(
      child: Container(
        child: Lottie.network(
          'https://lottie.host/f9676adb-22ad-4a2b-8d0f-d53a74fe94a3/tlxqxhzFxF.json',
        ),
      ),
    );
  }

  Future<void> setUp() async {
    widget.prefs = await SharedPreferences.getInstance();
    widget.isHome = (widget.prefs.getBool("is_home"))!;
  }
}
