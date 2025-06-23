import 'package:flutter/material.dart';
import 'package:themikg/view/widgets/custom_text.dart';

class CustomPopupMenuButton extends StatelessWidget {
  final List<String> items;
  final TextEditingController controller;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final Color? menuColor;

  const CustomPopupMenuButton({
    Key? key,
    required this.items,
    required this.controller,
    this.icon = Icons.arrow_drop_down_sharp,
    this.iconSize = 30,
    this.iconColor = Colors.white,
    this.menuColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
      color: menuColor,
      itemBuilder: (BuildContext context) => List.generate(items.length, (index) {
        return PopupMenuItem<String>(
          value: items[index],
          child: CustomText(text:items[index]), // You can replace with your CustomText if needed
        );
      }),
      onSelected: (String selectedValue) {
        controller.text = selectedValue;
      },
    );
  }
}