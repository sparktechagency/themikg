import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/view/widgets/custom_network_image.dart';

class ProductImageCarouselSlider extends StatefulWidget {
  const ProductImageCarouselSlider({
    super.key, required this.imageUrl,
  });
  final String imageUrl;

  @override
  State<ProductImageCarouselSlider> createState() =>
      _ProductImageCarouselSliderState();
}

class _ProductImageCarouselSliderState
    extends State<ProductImageCarouselSlider> {
  int _selectedSlider = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            // autoPlay: true,
              height: 327.h,
              enableInfiniteScroll: false,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                _selectedSlider = index;
                setState(() {});
              }),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent,
                  child: Center(
                      child: CustomNetworkImage(
                        imageUrl:widget.imageUrl,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 5; i++)
                Container(
                  margin: EdgeInsets.only(left: 4),
                  child: CircleAvatar(
                    radius: 4.r,
                    foregroundColor: Colors.blue,
                    backgroundColor:
                    _selectedSlider == i ? AppColors.primaryColor : null,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}