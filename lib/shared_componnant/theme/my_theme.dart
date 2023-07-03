import 'package:flutter/material.dart';
import 'package:news_app_route/shared_componnant/theme/colors.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: primaryColor,
      appBarTheme:  const AppBarTheme(
        elevation: 1,
        color: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          ),
        )
      ));
}
