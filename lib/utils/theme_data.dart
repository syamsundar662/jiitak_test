import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(surfaceTintColor: Colors.transparent),
    textButtonTheme: const TextButtonThemeData(
      style:
          ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black)),
    ),
    brightness: Brightness.light,
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.light().copyWith(
        background: Colors.white,
        primary: const Color.fromARGB(75, 179, 179, 179),
        secondary: Colors.grey,
        onPrimary: Colors.black,
        onTertiary: Colors.white),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.orange, unselectedItemColor: Colors.black));
