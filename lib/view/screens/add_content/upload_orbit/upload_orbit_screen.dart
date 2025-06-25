import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/fonts.gen.dart';
import 'package:themikg/helper/image_picker_helper.dart';
import 'package:themikg/view/widgets/custom_button.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_global_app_bar.dart';
import 'package:themikg/view/widgets/custom_text.dart';
import 'package:themikg/view/widgets/text_field_widget.dart';

class UploadOrbitScreen extends StatefulWidget {
  const UploadOrbitScreen({super.key});

  @override
  State<UploadOrbitScreen> createState() => _UploadOrbitScreenState();
}

class _UploadOrbitScreenState extends State<UploadOrbitScreen> {
  final ImagePickerHelper _imagePickerHelper = ImagePickerHelper();
  List<File> _profileImages = [];

  Future<void> _getPhotoFromGallery() async {
    final image = await _imagePickerHelper.pickFromGallery();
    if (image != null) {
      setState(() {
        _profileImages.add(image);
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _profileImages.removeAt(index); // Remove the image from the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomGlobalAppBar(
        title: 'Orbit',
        titleStyle: TextStyle(fontFamily: FontFamily.helvetica),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: 'Select Image'),
                SizedBox(height: 8.h),
                // Stack to contain the images and other UI components
                Stack(
                  children: [
                    CustomContainer(
                      alignment: Alignment.topRight,
                      color: AppColors.filledColor,
                      height: 130.h,
                      radiusAll: 16.r,
                    ),
                    // Use SizedBox to constrain the ListView horizontally
                    SizedBox(
                      height: 80.h, // Adjust the height for images
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _profileImages.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            alignment: Alignment(1.09, -.7),
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 8.w, top: 8.h),
                                child: CustomContainer(
                                  height: 58.h,
                                  width: 58.w,
                                  color: Colors.white,
                                  child: Image.file(
                                    _profileImages[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => _removeImage(index),
                                child: Icon(
                                  Icons.cancel,
                                  color: AppColors.errorColor,
                                  size: 20.h,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: IconButton(
                        onPressed: _getPhotoFromGallery,
                        icon: Icon(Icons.add_box_outlined, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.h,),
                CustomText(text: 'Add caption'),
                SizedBox(height: 8.h,),
                TextFieldWidget(hintText: 'Write here...',isPrefixShowing: false,maxLine: 6,),
                SizedBox(height: 100.h,),
                // Spacer(),
                CustomButton(onPressed: (){},label: 'Upload',fontWeight: FontWeight.w700,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
