import 'package:flutter/material.dart';
import 'package:themikg/view/screens/explore/universe_content/blink/blink_video/blink_video_screen.dart';
import 'package:themikg/view/widgets/blink_post_widget.dart';

class MyBlinkScreen extends StatefulWidget {
  const MyBlinkScreen({super.key});

  @override
  State<MyBlinkScreen> createState() => _MyBlinkScreenState();
}

class _MyBlinkScreenState extends State<MyBlinkScreen> {
  final List<String> dummyImageUrl = List.generate(
    10,
    (index) => "https://picsum.photos/200/300?random=$index",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
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
            child: BlinkPostWidget(imageUrl: dummyImageUrl[index]),
          );
        },
      ),
    );
  }
}
