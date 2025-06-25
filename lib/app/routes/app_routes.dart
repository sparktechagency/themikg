import 'package:get/get.dart';
import 'package:themikg/view/screens/add_content/nebulox/nebulox_screen.dart';
import 'package:themikg/view/screens/add_content/upload_orbit/upload_orbit_screen.dart';
import 'package:themikg/view/screens/add_content/video_recording/video_recording_screen.dart';
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
import 'package:themikg/view/screens/explore/universe_content/blink/blink_video/blink_video_screen.dart';
import 'package:themikg/view/screens/explore/universe_content/orbit/orbit_post/orbit_post_screen.dart';
import 'package:themikg/view/screens/explore/universe_content/orbit/orbit_screen.dart';
import 'package:themikg/view/screens/explore/universe_content/universe_content_screen.dart';
import 'package:themikg/view/screens/home/comments/comments_screen.dart';
import 'package:themikg/view/screens/home/home_screen.dart';
import 'package:themikg/view/screens/home/notifications/notifications_screen.dart';
import 'package:themikg/view/screens/message/inbox_message/audio_call/audio_call_screen.dart';
import 'package:themikg/view/screens/message/inbox_message/inbox_message_screen.dart';
import 'package:themikg/view/screens/message/inbox_message/video_call/video_call_screen.dart';
import 'package:themikg/view/screens/message/media/media_screen.dart';
import 'package:themikg/view/screens/message/message_screen.dart';
import 'package:themikg/view/screens/my_profile/edit_profile/edit_profile_screen.dart';
import 'package:themikg/view/screens/my_profile/edit_profile/find_your_people/find_your_people_screen.dart';
import 'package:themikg/view/screens/my_profile/edit_profile/your_curiosity/your_curiosity_screen.dart';
import 'package:themikg/view/screens/my_profile/my_blink/my_blink_screen.dart';
import 'package:themikg/view/screens/my_profile/my_orbit/my_orbit_screen.dart';
import 'package:themikg/view/screens/my_profile/my_profile_screen.dart';
import 'package:themikg/view/screens/my_profile/my_stellar/my_stellar_screen.dart';
import 'package:themikg/view/screens/my_profile/settings/about_us/about_us_screen.dart';
import 'package:themikg/view/screens/my_profile/settings/change_password/change_password_screen.dart';
import 'package:themikg/view/screens/my_profile/settings/privacy_policy/privacy_policy_screen.dart';
import 'package:themikg/view/screens/my_profile/settings/settings_screen.dart';
import 'package:themikg/view/screens/my_profile/settings/terms_condition/terms_conditionScreen.dart';
import 'package:themikg/view/screens/my_profile/vault/vault_screen.dart';
import 'package:themikg/view/screens/my_profile/wallet/wallet_screen.dart';
import 'package:themikg/view/screens/report/report_screen.dart';
import 'package:themikg/view/screens/user_profile/user_profile_screen.dart';

import '../../view/screens/report/submit_report/submit_report_screen.dart';

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
  static const String mediaScreen = '/mediaScreen';
  static const String audioCallScreen = '/audioCallScreen';
  static const String videoCallScreen = '/videoCallScreen';
  static const String myProfileScreen = '/myProfileScreen';
  static const String settingsScreen = '/settingsScreen';
  static const String changePasswordScreen = '/changePasswordScreen';
  static const String termsConditionScreen = '/termsConditionScreen';
  static const String privacyPolicyScreen = '/privacyPolicyScreen';
  static const String aboutUsScreen = '/aboutUsScreen';
  static const String vaultScreen = '/vaultScreen';
  static const String editProfileScreen = '/editProfileScreen';
  static const String walletScreen = '/walletScreen';
  static const String myOrbitScreen = '/myOrbitScreen';
  static const String myBlinkScreen = '/myBlinkScreen';
  static const String myStellarScreen = '/myStellarScreen';
  static const String reportScreen = '/reportScreen';
  static const String reportSubmitScreen = '/reportSubmitScreen';
  static const String userProfileScreen = '/userProfileScreen';
  static const String yourCuriosityScreen = '/yourCuriosityScreen';
  static const String findYourPeopleScreen = '/findYourPeopleScreen';
  static const String uploadOrbitScreen = '/uploadOrbitScreen';
  static const String videoRecordingScreen = '/videoRecordingScreen';
  // static const String uploadNebuloxScreen = '/uploadNebuloxScreen';


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
    GetPage(name: mediaScreen, page: () => MediaScreen()),
    GetPage(name: audioCallScreen, page: () => AudioCallScreen()),
    GetPage(name: videoCallScreen, page: () => VideoCallScreen()),
    GetPage(name: myProfileScreen, page: () => MyProfileScreen()),
    GetPage(name: settingsScreen, page: () => SettingsScreen()),
    GetPage(name: changePasswordScreen, page: () => ChangePasswordScreen()),
    GetPage(name: privacyPolicyScreen, page: () => PrivacyPolicyScreen()),
    GetPage(name: termsConditionScreen, page: () => TermsConditionScreen()),
    GetPage(name: aboutUsScreen, page: () => AboutUsScreen()),
    GetPage(name: vaultScreen, page: () => VaultScreen()),
    GetPage(name: editProfileScreen, page: () => EditProfileScreen()),
    GetPage(name: walletScreen, page: () => WalletScreen()),
    GetPage(name: myOrbitScreen, page: () => MyOrbitScreen()),
    GetPage(name: myBlinkScreen, page: () => MyBlinkScreen()),
    GetPage(name: myStellarScreen, page: () => MyStellarScreen()),
    GetPage(name: reportScreen, page: () => ReportScreen()),
    GetPage(name: reportSubmitScreen, page: () => SubmitReportScreen()),
    GetPage(name: userProfileScreen, page: () => UserProfileScreen()),
    GetPage(name: yourCuriosityScreen, page: () => YourCuriosityScreen()),
    GetPage(name: findYourPeopleScreen, page: () => FindYourPeopleScreen()),
    GetPage(name: uploadOrbitScreen, page: () => UploadOrbitScreen()),
    // GetPage(name: uploadNebuloxScreen, page: () => NebuloxScreen(image: image)),
    // GetPage(name: videoRecordingScreen, page: () => VideoRecordingScreen(videoFile: videoFile)),
  ];
}
