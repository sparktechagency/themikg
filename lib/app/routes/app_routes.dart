import 'package:get/get.dart';
import 'package:themikg/view/screens/auth/forget_password/forget_password_email.dart';
import 'package:themikg/view/screens/auth/forget_password/forget_password_otp_screen.dart';
import 'package:themikg/view/screens/auth/onboarding/onboarding_screen.dart';
import 'package:themikg/view/screens/auth/reset_password/reset_password_screen.dart';
import 'package:themikg/view/screens/auth/sign_in/sign_in_screen.dart';
import 'package:themikg/view/screens/auth/sign_up/sign_up_screen.dart';
import 'package:themikg/view/screens/auth/splash_screen/splash_screen.dart';
import 'package:themikg/view/screens/bottom_nav_bar/bottom_nav_bar_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splashScreen';
  static const String onboardingScreen = '/onboardingScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String signInScreen = '/signInScreen';
  static const String forgetPasswordEmailScreen = '/forgetPasswordEmailScreen';
  static const String forgetPasswordOtpScreen = '/forgetPasswordOtpScreen';
  static const String resetPasswordScreen = '/resetPasswordScreen';
  static const String bottomNavBarScreen = '/bottomNavBarScreen';

  static List<GetPage> get routes => [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: onboardingScreen, page: () => OnboardingScreen()),
    GetPage(name: signUpScreen, page: () => SignUpScreen()),
    GetPage(name: signInScreen, page: () => SignInScreen()),
    GetPage(name: forgetPasswordEmailScreen, page: () => ForgetPasswordEmail()),
    GetPage(name: forgetPasswordOtpScreen, page: () => ForgetPasswordOtpScreen()),
    GetPage(name: resetPasswordScreen, page: () => ResetPasswordScreen()),
    GetPage(name: bottomNavBarScreen, page: () => BottomNavBarScreen()),
  ];
}
