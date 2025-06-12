import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:themikg/app/utils/app_color.dart';

class AppThemeData {
  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.bgColor,
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.bgColor,
        systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
        ),
      ),
    );
  }
}
