import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleDetailWidget extends StatelessWidget {
  final String title;
  final String content;

  const ArticleDetailWidget({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Text(
            title,
            style: TextStyles.settingTileText,
          ),
          SizedBox(height: 12.h),
          Text(
            content,
            style: TextStyles.inputText,
          ),
        ],
      ),
    );
  }
}
