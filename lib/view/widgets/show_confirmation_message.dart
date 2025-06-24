import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:themikg/gen/fonts.gen.dart';
import 'package:themikg/view/widgets/custom_text.dart';

///<<<<<<<<<<<======Pop Up message=======>>>>>>>>>>>>>
void showSentConfirmation(
    {required String message, required BuildContext context}) {
  Flushbar(
    margin: EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(8),
    duration: Duration(seconds: 3),
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: Colors.white,

    messageText: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: message,
          color: Colors.green,
          fontWeight: FontWeight.w500,
          fontName: FontFamily.helvetica,
          textAlign: TextAlign.start,
        ),
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
      ],
    ),
  ).show(context);
}
