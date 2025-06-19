import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/gen/fonts.gen.dart';

class CustomGlobalAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomGlobalAppBar({
    super.key,
    this.title,
    this.showLeading = true,
    this.actions,
    this.titleWidget,
    this.backAction,
    this.titleSize = 16,
    this.centerTitle = true,
    this.showBorder = false,
    this.flexibleSpace,
    this.titleStyle,
    this.backgroundColor
  });

  final String? title;
  final double titleSize;
  final bool centerTitle;
  final Widget? titleWidget;
  final Widget? flexibleSpace;
  final bool showLeading;
  final bool showBorder;
  final List<Widget>? actions;
  final VoidCallback? backAction;
  final TextStyle? titleStyle;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      shape:
          showBorder
              ? Border(bottom: BorderSide(color: Colors.grey, width: 0.2))
              : null,
      centerTitle: centerTitle,
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor:backgroundColor ,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      leading:
          showLeading
              ? TextButton(
                onPressed: backAction ?? () => Navigator.pop(context),
                child: Center(
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 24.sp,
                  ),
                ),
              )
              : null,
      title:
          title != null && title != ''
              ? Text(
                title!,
                style:titleStyle?? TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: titleSize.sp,
                  color: Colors.white,
                  fontFamily: FontFamily.trajanPro,
                ),
              )
              : titleWidget,
      flexibleSpace: flexibleSpace,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
