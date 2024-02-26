import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onPressed;
  final ShapeBorder? shape;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.onPressed, this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      titleSpacing: 20.w,
      titleTextStyle: TextStyles.appbarTitleText,
      centerTitle: false,
      elevation: 5,
      shadowColor: AppColors.elevButtnShadow,
      shape: shape,
      // RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(
      //     20,
      //   ),
      // ),
      backgroundColor: AppColors.white,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: FloatingActionButton(
            onPressed: onPressed,
            elevation: 0,
            shape: const CircleBorder(),
            backgroundColor: AppColors.yellow,
            child: Icon(
              Icons.add,
              color: AppColors.white,
              size: 28.dg,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100.h);
}
