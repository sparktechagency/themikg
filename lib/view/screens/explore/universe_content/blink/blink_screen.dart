import 'package:flutter/material.dart';
import 'package:themikg/view/screens/explore/universe_content/blink/blink_video/blink_video_screen.dart';
import 'package:themikg/view/widgets/blink_post_widget.dart';

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
            child: BlinkPostWidget(imageUrl: dummyImageUrl[index]),
          );
        },
      ),
    );
  }
}
