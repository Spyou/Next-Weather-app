import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_2/utils/themes.dart';

import 'screens/home_screen.dart';
import 'screens/onboard_screen.dart';
import 'screens/splash.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  bool isHome = false;

  late SharedPreferences prefs;
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    setUp();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: CustomThemes.lightTheme,
      darkTheme: CustomThemes.darkTheme,
      themeMode: ThemeMode.system,
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      home: Splash(),
      routes: {
        Onboarding.route: (context) {
          return const Onboarding();
        },
        HomePage.route: (context) {
          return const HomePage();
        },
      },
    );
  }

  Future<void> setUp() async {
    widget.prefs = await SharedPreferences.getInstance();
    widget.isHome = (widget.prefs.getBool("is_home"))!;
  }
}
