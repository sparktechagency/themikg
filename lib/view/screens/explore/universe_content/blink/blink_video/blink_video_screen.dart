import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/gen/assets.gen.dart';
import 'package:themikg/models/comment_model/comment_model.dart';
import 'package:themikg/models/reel_model/reel_model.dart';
import 'package:themikg/view/screens/home/comments/comments_screen.dart';
import 'package:themikg/view/widgets/custom_button.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_global_app_bar.dart';
import 'package:themikg/view/widgets/custom_network_image.dart';
import 'package:themikg/view/widgets/custom_text.dart';
import 'package:video_player/video_player.dart';

import 'blink_video_screen.dart' as _videoPlayerController;

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
  final List<VideoPlayerController> _videoPlayerController = [];
  double _progress = 0.0;
  int _currentIndex = 0;

  final List<ReelModel> reelsList = [
    ReelModel(
      videoUrl:
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      name: 'Anny Wiliam',
      userName: "anny-09",
      userProfile: "https://i.pravatar.cc/150?img=69",
      likes: 132,
      comments: 56,
      commentList: [
        CommentModel(
          profileImage: 'https://i.pravatar.cc/150?img=55',
          userName: "userName",
          name: "Jon Doe",
          comment: "Wow!! i appreciate it",
          likeCount: 2,
          commentTime: DateTime.now(),
        ),
        CommentModel(
          profileImage: 'https://i.pravatar.cc/150?img=54',
          userName: "userName",
          name: "Edmund Agziri",
          comment: "Nice video fully support",
          likeCount: 10,
          commentTime: DateTime.now(),
        ),
      ],
    ),
    ReelModel(
      videoUrl:
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
      name: 'Mark Phillips',
      userName: "mk_345",
      userProfile: "https://i.pravatar.cc/150?img=70",
      likes: 132,
      comments: 56,
      commentList: [
        CommentModel(
          profileImage: 'https://i.pravatar.cc/150?img=55',
          userName: "userName",
          name: "Jon Doe",
          comment: "Wow!! i appreciate it",
          likeCount: 2,
          commentTime: DateTime.now(),
        ),
        CommentModel(
          profileImage: 'https://i.pravatar.cc/150?img=54',
          userName: "userName",
          name: "Edmund Agziri",
          comment: "Nice video fully support",
          likeCount: 10,
          commentTime: DateTime.now(),
        ),
      ],
    ),
  ];

  void _togglePlayPause() {
    setState(() => _showController = true);
    if (_showController) {
      Future.delayed(Duration(seconds: 3), () {
        if (mounted && _videoPlayerController[_currentIndex].value.isPlaying) {
          setState(() => _showController = false);
        }
      });
    }
  }

  final List<String> videoUrl = [
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  ];

  @override
  void initState() {
    super.initState();
    // Initialize the video controller with the video URL
    for (var urls in videoUrl) {
      _videoPlayerController.add(
        VideoPlayerController.networkUrl(Uri.parse(urls))
          ..initialize().then((_) {
            setState(() {});
          }),
      );
    }
    // _videoPlayerController =
    //     VideoPlayerController.networkUrl(
    //         Uri.parse(
    //           'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    //         ),
    //       )
    //       ..initialize().then((_) {
    //         setState(() {});
    //       })
    //       ..addListener(_videoListener);
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) setState(() => _showController = false);

    });
  }

  void _videoListener(int index) {
    if (_videoPlayerController[index].value.isPlaying != _isPlaying) {
      setState(() {
        _isPlaying = _videoPlayerController[index].value.isPlaying;
        _showController = !_isPlaying;
      });
    }
    if (_videoPlayerController[index].value.isInitialized) {
      setState(() {
        _progress =
            _videoPlayerController[index].value.position.inMilliseconds /
            _videoPlayerController[index].value.duration.inMilliseconds;
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _videoPlayerController) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomGlobalAppBar(title: 'Blink'),
      body: SafeArea(
        child: PageView.builder(
          itemCount: reelsList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: _togglePlayPause,
              child: Stack(
                children: [
                  CustomContainer(
                    alignment: Alignment(0.0, -0.2),
                    height: double.maxFinite,
                    width: double.maxFinite,
                    color: Colors.black,
                    child: AspectRatio(
                      aspectRatio:
                          _videoPlayerController[index].value.aspectRatio,
                      child: _videoPlayerController[index].value.isInitialized
                          ? VideoPlayer(_videoPlayerController[index])
                          : Center(child: CircularProgressIndicator()),
                    ),
                  ),
                  // Positioned(
                  //   bottom: 0,
                  //   child: Slider(
                  //     value: _progress,
                  //     onChanged: (double value) {
                  //       setState(() {
                  //         _progress = value;
                  //         final position = Duration(
                  //           milliseconds:
                  //               (_videoPlayerController
                  //                           .value
                  //                           .duration
                  //                           .inMilliseconds *
                  //                       value)
                  //                   .toInt(),
                  //         );
                  //         _videoPlayerController.seekTo(position);
                  //       });
                  //     },
                  //     min: 0.0,
                  //     max: 1.0,
                  //     activeColor: AppColors.primaryColor,
                  //     // divisions: 2,
                  //     mouseCursor: MouseCursor.uncontrolled,
                  //   ),
                  // ),
                  if (_showController)
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment(0.0, -0.1),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _videoPlayerController[index].value.isPlaying
                                  ? _videoPlayerController[index].pause()
                                  : _videoPlayerController[index].play();
                              _showController = true;
                            });
                          },
                          icon: Icon(
                            _videoPlayerController[index].value.isPlaying
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
                                imageUrl: reelsList[index].userProfile,
                                height: 50.h,
                                width: 50.w,
                                boxShape: BoxShape.circle,
                              ),
                              SizedBox(width: 8.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: reelsList[index].userName,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  CustomText(text: reelsList[index].name),
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
                          // Row(
                          //   children: [
                          //     CustomNetworkImage(
                          //       imageUrl: "https://picsum.photos/200/300",
                          //       height: 25.h,
                          //       width: 25.w,
                          //       boxShape: BoxShape.circle,
                          //     ),
                          //     CustomText(text: 'Favorite by '),
                          //     CustomText(
                          //       text: 'Justin Bieber',
                          //       fontWeight: FontWeight.w700,
                          //     ),
                          //   ],
                          // ),
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
                          spacing: 6,
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
                                  isReactSelected = isReactSelected == 0
                                      ? 1
                                      : 0;
                                });
                              },
                            ),

                            ///Like count=================================================
                            CustomText(
                              text: '12342',
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Column(
                          spacing: 6,
                          children: [
                            IconButton(
                              icon: Icon(
                                CupertinoIcons.chat_bubble_text,
                                color: Colors.white,
                                size: 30.h,
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                  // scrollControlDisabledMaxHeightRatio: .7,
                                  context: context,
                                  builder: (context) {
                                    return CustomContainer(
                                      color: AppColors.bgColor,
                                      topLeftRadius: 16.r,
                                      topRightRadius: 16.r,
                                      child: ListView.builder(
                                        itemCount:
                                            reelsList[index].commentList.length,
                                        itemBuilder: (context, index) {
                                          final comment = reelsList[index]
                                              .commentList[index];
                                          return Padding(
                                            padding: EdgeInsets.all(16.r),
                                            child: CommentWidget(
                                              profileImage:
                                                  comment.profileImage,
                                              userName: comment.userName,
                                              name: comment.name,
                                              commentText: comment.comment,
                                              commentLikesCount:
                                                  comment.likeCount,
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            CustomText(
                              text: '12342',
                              fontWeight: FontWeight.w700,
                            ),
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
            );
          },
        ),
      ),
    );
  }
}
