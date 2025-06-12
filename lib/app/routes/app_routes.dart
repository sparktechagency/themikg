import 'package:get/get.dart';
import 'package:themikg/view/screens/auth/onboarding/onboarding_screen.dart';
import 'package:themikg/view/screens/auth/sign_up/sign_up_screen.dart';
import 'package:themikg/view/screens/auth/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splashScreen';
  static const String onboardingScreen = '/onboardingScreen';
  static const String signUpScreenScreen = '/signUpScreen';

  static List<GetPage> get routes => [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: onboardingScreen, page: () => OnboardingScreen()),
    GetPage(name: signUpScreenScreen, page: () => SignUpScreen()),
  ];
}
