import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// Light Mode
class CustomThemes {
  static final lightTheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Vx.black,
      secondaryHeaderColor: Colors.grey.shade900,
      popupMenuTheme:
          const PopupMenuThemeData(color: Color.fromARGB(255, 255, 255, 255)),
      focusColor: Vx.gray200,
      dividerColor: const Color.fromARGB(167, 147, 147, 147),
      iconTheme: const IconThemeData(
        color: Vx.gray600,
      ));

// Dark Mode
  static final darkTheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black,
      primaryColor: Colors.white,
      secondaryHeaderColor: const Color.fromARGB(195, 255, 255, 255),
      popupMenuTheme:
          const PopupMenuThemeData(color: Color.fromARGB(255, 40, 40, 40)),
      focusColor: const Color.fromARGB(67, 158, 158, 158),
      dividerColor: const Color.fromARGB(167, 147, 147, 147),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ));
}
