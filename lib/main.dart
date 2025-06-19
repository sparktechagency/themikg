import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:themikg/app/app.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light, // For Android (white icons)
      statusBarBrightness: Brightness.dark,      // For iOS (dark icons)
    ),
  );
  runApp(MyApp());
}


