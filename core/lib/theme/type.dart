import 'package:flutter/material.dart';

abstract class Type {
  static TextTheme notoSans = TextTheme(
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      height: 1.5
    ),
    bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        height: 1.5
    ),
    bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        height: 1.5
    ),
    labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 1.5
    ),
    labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.5
    ),
    labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.5
    ),
    titleSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        height: 1.5
    ),
    titleMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 1.5
    ),
    titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        height: 1.5
    ),
  );
}