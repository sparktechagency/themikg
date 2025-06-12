import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:themikg/app/routes/app_routes.dart';
import 'package:themikg/app/theme/dark_theme.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/view/screens/auth/splash_screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 852),
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Themikg',
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          initialRoute: AppRoutes.splashScreen,
          getPages: AppRoutes.routes,
          themeMode: ThemeMode.dark,
          // theme: ThemeData.dark(useMaterial3: true),
          darkTheme: AppThemeData.darkTheme
        );
      },
    );
  }
}
