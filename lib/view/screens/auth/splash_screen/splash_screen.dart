import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:themikg/app/routes/app_routes.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/assets.gen.dart';
import 'package:themikg/view/widgets/custom_loader.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _moveToNextScreen() async{
    await Future.delayed(Duration(seconds: 3));
    Get.offAllNamed(AppRoutes.onboardingScreen);
  }

  @override
  void initState() {
    _moveToNextScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Assets.images.splashScreenBgImage.image(fit: BoxFit.cover),
          ),
          Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 287.h,),
                Assets.images.appLogo.image(height: 211.h,width: 211.w),
                SizedBox(height: 208.h,),
                SpinKitRing(color: AppColors.primaryColor,lineWidth: 6,size: 50,),
                // Expanded(child: ProgressWithThumbDemo())
              ],
            ),
          )
        ],
      ),
    );
  }
}
