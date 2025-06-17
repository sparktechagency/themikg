import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reels_viewer/reels_viewer.dart';
import 'package:themikg/app/routes/app_routes.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/assets.gen.dart';
import 'package:themikg/view/widgets/custom_button.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_global_app_bar.dart';
import 'package:themikg/view/widgets/custom_network_image.dart';
import 'package:themikg/view/widgets/custom_text.dart';
import 'package:video_player/video_player.dart';

class BlinkScreen extends StatefulWidget {
  const BlinkScreen({super.key});

  @override
  State<BlinkScreen> createState() => _BlinkScreenState();
}

class _BlinkScreenState extends State<BlinkScreen> {
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
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReelsScreen()),
              );
              // ReelsScreen(reelsList: reelsList);
            },
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                CustomContainer(
                  height: 202.h,
                  width: 100.w,
                  // color: Colors.white,
                  radiusAll: 8.r,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: CustomNetworkImage(imageUrl: dummyImageUrl[index]),
                  ),
                ),
                Icon(
                  Icons.play_circle_fill_outlined,
                  color: Colors.white,
                  shadows: [Shadow(color: AppColors.greyColor)],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  int isSelected = 1;
  int isReactSelected = 0;
  int isVideoPlaying = 0;
  bool isReelsPlaying = false;
  bool _showController = true;
  bool _isPlaying = false;
  late VideoPlayerController _videoPlayerController;
  List<ReelModel> reelsList = [
    ReelModel(
      'https://assets.mixkit.co/videos/preview/mixkit-tree-with-yellow-flowers-1173-large.mp4',
      'Darshan Patil',
      likeCount: 2000,
      isLiked: true,
      musicName: 'In the name of Love',
      reelDescription: "Life is better when you're laughing.",
      profileUrl:
          'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
      commentList: [
        ReelCommentModel(
          comment: 'Nice...',
          userProfilePic:
              'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
          userName: 'Darshan',
          commentTime: DateTime.now(),
        ),
        ReelCommentModel(
          comment: 'Superr...',
          userProfilePic:
              'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
          userName: 'Darshan',
          commentTime: DateTime.now(),
        ),
        ReelCommentModel(
          comment: 'Great...',
          userProfilePic:
              'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
          userName: 'Darshan',
          commentTime: DateTime.now(),
        ),
      ],
    ),
    ReelModel(
      'https://assets.mixkit.co/videos/preview/mixkit-father-and-his-little-daughter-eating-marshmallows-in-nature-39765-large.mp4',
      'Rahul',
      musicName: 'In the name of Love',
      reelDescription: "Life is better when you're laughing.",
      profileUrl:
          'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
    ),
    ReelModel(
      'https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4',
      'Rahul',
    ),
  ];

  void _togglePlayPause() {
    setState(() => _showController = true);
    if (_showController) {
      Future.delayed(Duration(seconds: 3), () {
        if (mounted && _videoPlayerController.value.isPlaying) {
          setState(() => _showController = false);
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Initialize the video controller with the video URL
    _videoPlayerController =
        VideoPlayerController.networkUrl(
            Uri.parse(
              'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
            ),
          )
          ..initialize().then((_) {
            setState(() {}); // Ensure widget rebuilds when video is initialized
          })
          ..addListener(_videoListener);
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) setState(() => _showController = false);
    });
  }

  void _videoListener() {
    if (_videoPlayerController.value.isPlaying != _isPlaying) {
      setState(() {
        _isPlaying = _videoPlayerController.value.isPlaying;
        _showController = !_isPlaying;
      });
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomGlobalAppBar(title: 'Blink'),
      body: SafeArea(
        child: GestureDetector(
          onTap: _togglePlayPause,
          child: Stack(
            children: [
              CustomContainer(
                alignment: Alignment(0.0, -0.2),
                height: double.maxFinite,
                width: double.maxFinite,
                color: Colors.black,
                child: CustomContainer(
                  height: MediaQuery.of(context).size.height*.6,
                  width: MediaQuery.of(context).size.width,
                  child: _videoPlayerController.value.isInitialized
                      ? VideoPlayer(_videoPlayerController)
                      : Center(child: CircularProgressIndicator()),
                ),
              ),
              if (_showController)
                Positioned.fill(
                  child: Align(
                    alignment: Alignment(0.0, -0.1),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _videoPlayerController.value.isPlaying
                              ? _videoPlayerController.pause()
                              : _videoPlayerController.play();
                          _showController = true;
                        });
                      },
                      icon: Icon(
                        _videoPlayerController.value.isPlaying
                            ? Icons.pause_circle_filled_outlined
                            : Icons.play_circle_fill_outlined,
                        color: Colors.white.withOpacity(0.8),
                        size: 50.h,
                      ),
                    ),
                  ),
                ),
              Positioned(
                bottom: 20,
                left: 20,
                child: SizedBox(
                  width: 300.w,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CustomNetworkImage(
                            imageUrl: "https://picsum.photos/200/300",
                            height: 50.h,
                            width: 50.w,
                            boxShape: BoxShape.circle,
                          ),
                          SizedBox(width: 8.w),
                          Column(
                            children: [
                              CustomText(
                                text: 'anny_wilson',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                              CustomText(text: 'Anny Wilson'),
                            ],
                          ),
                          SizedBox(width: 24.w),
                          CustomButton(
                            onPressed: () {
                              setState(() {
                                isSelected = isSelected == 0 ? 1 : 0;
                              });
                            },
                            label: isSelected == 0 ? 'Linked' : 'Link',
                            backgroundColor: isSelected == 0
                                ? Colors.transparent
                                : null,
                            bordersColor: isSelected == 0
                                ? AppColors.primaryColor
                                : null,
                            width: 92.w,
                            height: 30.h,
                          ),
                        ],
                      ),
                      SizedBox(height: 32.h),
                      Row(
                        children: [
                          CustomNetworkImage(
                            imageUrl: "https://picsum.photos/200/300",
                            height: 25.h,
                            width: 25.w,
                            boxShape: BoxShape.circle,
                          ),
                          CustomText(text: 'Favorite by '),
                          CustomText(
                            text: 'Justin Bieber',
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 20,
                bottom: 40,
                child: Column(
                  spacing: 8,
                  children: [
                    Column(
                      spacing: 2,
                      children: [
                        GestureDetector(
                          child: Assets.icons.reactIcon1.svg(
                            color: isReactSelected == 1
                                ? AppColors.primaryColor
                                : Colors.white,
                            height: 35.h,
                            width: 35.w,
                          ),
                          onTap: () {
                            setState(() {
                              isReactSelected = isReactSelected == 0 ? 1 : 0;
                            });
                          },
                        ),
                        CustomText(text: '12342', fontWeight: FontWeight.w700),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Column(
                      spacing: 2,
                      children: [
                        Icon(
                          Icons.comment_outlined,
                          color: Colors.white,
                          size: 30.h,
                        ),
                        CustomText(text: '12342', fontWeight: FontWeight.w700),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Assets.icons.moreCircleIcon.svg(
                      color: Colors.white,
                      height: 35.h,
                      width: 35.w,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
