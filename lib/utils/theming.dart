import 'package:flutter/material.dart';
import 'package:movies_app/utils/colors.dart';

class MyThemeData {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: backGround,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(

      type: BottomNavigationBarType.fixed,
      selectedItemColor: onNavSelected,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.transparent,
    ),
  );
}
