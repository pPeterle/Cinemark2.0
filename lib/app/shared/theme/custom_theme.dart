import 'package:cinemark_2/app/shared/theme/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: CustomColors.blue,
      scaffoldBackgroundColor: CustomColors.background,
      fontFamily: 'Montserrat', //3
      canvasColor: CustomColors.background,
      buttonTheme: const ButtonThemeData(
        buttonColor: CustomColors.red,
      ),
    );
  }
}
