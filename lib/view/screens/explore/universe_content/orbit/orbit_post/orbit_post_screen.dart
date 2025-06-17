import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/gen/fonts.gen.dart';
import 'package:themikg/view/widgets/card_for_post.dart';
import 'package:themikg/view/widgets/custom_container.dart';
import 'package:themikg/view/widgets/custom_global_app_bar.dart';

class OrbitPostScreen extends StatefulWidget {
  const OrbitPostScreen({super.key});

  @override
  State<OrbitPostScreen> createState() => _OrbitPostScreenState();
}

class _OrbitPostScreenState extends State<OrbitPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomGlobalAppBar(title: 'Orbit',titleStyle: TextStyle(fontFamily: FontFamily.helvetica,fontWeight: FontWeight.w700),),
      body:ListView.builder(
        itemCount: 7,
          // padding: EdgeInsets.symmetric(vertical: 8),
          itemBuilder: (context,index){
        return  Padding(
          padding: EdgeInsets.only(bottom:16.r ),
          child: CardForPost(
            profileImage: 'https://picsum.photos/200/300',
            name: "Anny Wilson",
            userName: "anny_wilson_9",
            postTitle:
            "ArthurHazan Quel plaisir de retrouver mes étudiants de Web 2 ! Ils ont tellement progressés depuis l’année dernière ! #Proud",
            postImage: 'https://picsum.photos/200/300',
            likeCount: 234,
            commentCount: 234,
          ),
        );
      })
    );
  }
}
