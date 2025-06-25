import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:themikg/app/routes/app_routes.dart';
import 'package:themikg/view/widgets/custom_button.dart';
import 'package:themikg/view/widgets/custom_global_app_bar.dart';

class NebuloxScreen extends StatelessWidget {
  final File image; // The photo passed from the previous screen

  const NebuloxScreen({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomGlobalAppBar(),
      body: Center(
        child: Stack(
          alignment: Alignment(0, 1),
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the image passed from the previous screen
            Image.file(image),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(onPressed: () {
                Get.offAllNamed(AppRoutes.bottomNavBarScreen);
              },label: 'Upload Nebulox',fontWeight: FontWeight.w700,fontSize: 18.sp,),
            ),
            // SizedBox(height: 16.h,)
          ],
        ),
      ),
    );
  }
}
