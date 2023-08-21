import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});
  static const route = "introduction-route";

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 48, 190, 255),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 50),
            FadeInLeft(
              duration: const Duration(milliseconds: 1500),
              delay: const Duration(
                milliseconds: 500,
              ),
              child: Image.network(
                'https://coalregioncanary.com/wp-content/uploads/2020/08/summer.gif',
                fit: BoxFit.cover,
              ),
            ),
            FadeInUp(
              duration: const Duration(
                milliseconds: 1000,
              ),
              delay: const Duration(
                milliseconds: 500,
              ),
              child: Container(
                padding: const EdgeInsets.only(
                    left: 30, top: 40, right: 20, bottom: 20),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeInUp(
                        duration: const Duration(milliseconds: 1000),
                        delay: const Duration(
                          milliseconds: 500,
                        ),
                        child: const Text(
                          'Welcome To Next Weather',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1000),
                        delay: const Duration(
                          milliseconds: 500,
                        ),
                        child: const Text(
                          "We use the latest data from trusted sources to give you real-time weather updates, ensuring that you're always in the know about the current conditions.",
                          style: TextStyle(
                            fontSize: 18,
                            // fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              isHomeUpdate(true);
                              Navigator.pushReplacementNamed(
                                  context, HomePage.route);
                            },
                            child: FadeInLeft(
                              duration: const Duration(milliseconds: 1000),
                              delay: const Duration(
                                milliseconds: 500,
                              ),
                              child: const Text(
                                "Get Started",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> isHomeUpdate(bool isHome) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool("is_home", isHome);
  }
}
