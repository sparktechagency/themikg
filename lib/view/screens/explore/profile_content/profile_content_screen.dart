import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/view/widgets/custom_button.dart';
import 'package:themikg/view/widgets/custom_network_image.dart';
import 'package:themikg/view/widgets/custom_text.dart';
import 'package:themikg/view/widgets/profile_item_widget.dart';

class ProfileContentScreen extends StatefulWidget {
  const ProfileContentScreen({super.key});

  @override
  State<ProfileContentScreen> createState() => _ProfileContentScreenState();
}

class _ProfileContentScreenState extends State<ProfileContentScreen> {
  // int isSelected=0;
  List<bool> isSelectedList = List.generate(10, (index) => false);

  // imageUrl: "https://i.pravatar.cc/150?img=21",
  List<Map<String, dynamic>> profiles = [
    {
      'imageUrl': 'https://i.pravatar.cc/150?img=1',
      'userName': 'Jane_Co100',
      'fullName': 'Wade Warren',
      'isSelected': false,
    },
    {
      'imageUrl': 'https://i.pravatar.cc/150?img=2',
      'userName': 'John_Doe123',
      'fullName': 'John Doe',
      'isSelected': false,
    },
    {
      'imageUrl': 'https://i.pravatar.cc/150?img=3',
      'userName': 'Sarah_Lee200',
      'fullName': 'Sarah Lee',
      'isSelected': false,
    },
    {
      'imageUrl': 'https://i.pravatar.cc/150?img=4',
      'userName': 'Mike_Johnson45',
      'fullName': 'Mike Johnson',
      'isSelected': false,
    },
    {
      'imageUrl': 'https://i.pravatar.cc/150?img=5',
      'userName': 'Anna_Smith88',
      'fullName': 'Anna Smith',
      'isSelected': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          return ProfileItem(
            imageUrl: profiles[index]['imageUrl'],
            userName: profiles[index]['userName'],
            fullName: profiles[index]['fullName'],
            isSelected: isSelectedList[index],
            onTap: () {
              setState(() {
                isSelectedList[index] = !isSelectedList[index];
              });
            },
          );
        },
      ),
    );
  }
}
