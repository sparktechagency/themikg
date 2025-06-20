import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/gen/fonts.gen.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_global_app_bar.dart';
import 'package:themikg/view/widgets/custom_network_image.dart';

class MediaScreen extends StatefulWidget {
  const MediaScreen({super.key});

  @override
  State<MediaScreen> createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen> {
  final List<String> dummyImageUrl = List.generate(
    20,
    (index) => "https://picsum.photos/200/300?random=$index",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomGlobalAppBar(
        title: 'Media',
        centerTitle: false,
        titleStyle: TextStyle(
          fontSize: 18.sp,
          fontFamily: FontFamily.helvetica,
        ),
      ),
      body: GridView.builder(
        itemCount: dummyImageUrl.length,
        padding: EdgeInsets.all(24.r),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: .60,
        ),
        itemBuilder: (context, index) {
          return CustomContainer(
            height: 202.h,
            width: 111.w,
            radiusAll: 8.r,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CustomNetworkImage(imageUrl: dummyImageUrl[index]),
            ),
          );
        },
      ),
    );
  }
}

