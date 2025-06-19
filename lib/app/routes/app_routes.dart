import 'package:get/get.dart';
import 'package:themikg/view/screens/auth/forget_password/forget_password_email.dart';
import 'package:themikg/view/screens/auth/forget_password/forget_password_otp_screen.dart';
import 'package:themikg/view/screens/auth/onboarding/onboarding_screen.dart';
import 'package:themikg/view/screens/auth/reset_password/reset_password_screen.dart';
import 'package:themikg/view/screens/auth/sign_in/sign_in_screen.dart';
import 'package:themikg/view/screens/auth/sign_up/sign_up_screen.dart';
import 'package:themikg/view/screens/auth/splash_screen/splash_screen.dart';
import 'package:themikg/view/screens/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:themikg/view/screens/explore/explore_screen.dart';
import 'package:themikg/view/screens/explore/people_by_location/people_by_location_screen.dart';
import 'package:themikg/view/screens/explore/universe_content/blink/blink_screen.dart';
import 'package:themikg/view/screens/explore/universe_content/blink/blink_video/blink_video_screen.dart';
import 'package:themikg/view/screens/explore/universe_content/orbit/orbit_post/orbit_post_screen.dart';
import 'package:themikg/view/screens/explore/universe_content/orbit/orbit_screen.dart';
import 'package:themikg/view/screens/explore/universe_content/universe_content_screen.dart';
import 'package:themikg/view/screens/home/comments/comments_screen.dart';
import 'package:themikg/view/screens/home/home_screen.dart';
import 'package:themikg/view/screens/home/notifications/notifications_screen.dart';
import 'package:themikg/view/screens/message/inbox_message/inbox_message_screen.dart';
import 'package:themikg/view/screens/message/message_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splashScreen';
  static const String onboardingScreen = '/onboardingScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String signInScreen = '/signInScreen';
  static const String forgetPasswordEmailScreen = '/forgetPasswordEmailScreen';
  static const String forgetPasswordOtpScreen = '/forgetPasswordOtpScreen';
  static const String resetPasswordScreen = '/resetPasswordScreen';
  static const String bottomNavBarScreen = '/bottomNavBarScreen';
  static const String homeScreen = '/homeScreen';
  static const String commentScreen = '/commentScreen';
  static const String notificationsScreen = '/notificationsScreen';
  static const String exploreScreen = '/exploreScreen';
  static const String peopleByLocationScreen = '/peopleByLocationScreen';
  static const String universeContentScreen = '/universeContentScreen';
  static const String orbitScreen = '/orbitScreen';
  static const String orbitPostScreen = '/orbitPostScreen';
  static const String reelsScreen = '/reelsScreen';
  static const String messageScreen = '/messageScreen';
  static const String inboxMessageScreen = '/inboxMessageScreen';


  static List<GetPage> get routes => [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: onboardingScreen, page: () => OnboardingScreen()),
    GetPage(name: signUpScreen, page: () => SignUpScreen()),
    GetPage(name: signInScreen, page: () => SignInScreen()),
    GetPage(name: forgetPasswordEmailScreen, page: () => ForgetPasswordEmail()),
    GetPage(name: forgetPasswordOtpScreen, page: () => ForgetPasswordOtpScreen()),
    GetPage(name: resetPasswordScreen, page: () => ResetPasswordScreen()),
    GetPage(name: bottomNavBarScreen, page: () => BottomNavBarScreen()),
    GetPage(name: homeScreen, page: () => HomeScreen()),
    GetPage(name: commentScreen, page: () => CommentsScreen()),
    GetPage(name: notificationsScreen, page: () => NotificationsScreen()),
    GetPage(name: exploreScreen, page: () => ExploreScreen()),
    GetPage(name: peopleByLocationScreen, page: () => PeopleByLocationScreen()),
    GetPage(name: universeContentScreen, page: () => UniverseContentScreen()),
    GetPage(name: orbitScreen, page: () => OrbitScreen()),
    GetPage(name: orbitPostScreen, page: () => OrbitPostScreen()),
    GetPage(name: reelsScreen, page: () => ReelsScreen()),
    GetPage(name: messageScreen, page: () => MessageScreen()),
    GetPage(name: inboxMessageScreen, page: () => InboxMessageScreen()),
  ];
}
