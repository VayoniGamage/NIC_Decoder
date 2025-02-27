import 'package:flutter/material.dart';

const Color backgroundColor = Color(0xFFCCDBDC);
const Color buttonColor = Color(0xFF567485);
const Color highlightColor = Color(0xFFE7C582);
const Color textColor = Colors.black;
const Color headerColor = Color(0xFF007EA7);
const Color navBarColor = Color(0xFF003249);

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: backgroundColor,
  primaryColor: headerColor,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: textColor),
    bodyMedium: TextStyle(color: textColor),
  ),
);
