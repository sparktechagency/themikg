import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:themikg/app/routes/app_routes.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_network_image.dart';

class OrbitScreen extends StatefulWidget {
  const OrbitScreen({super.key});

  @override
  State<OrbitScreen> createState() => _OrbitScreenState();
}

class _OrbitScreenState extends State<OrbitScreen> {
  final List<String> dummyImageUrl = List.generate(
    10,
        (index) => "https://picsum.photos/200/300?random=$index",
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 3,
          childAspectRatio: .55,
        ),
        itemCount: dummyImageUrl.length,
        itemBuilder: (context, index) {
          return CustomContainer(
            height: 202.h,
            width: 100.w,
            // color: Colors.white,
            onTap: (){
              Get.toNamed(AppRoutes.orbitPostScreen);
            },
            radiusAll: 8.r,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CustomNetworkImage(
                imageUrl: dummyImageUrl[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
