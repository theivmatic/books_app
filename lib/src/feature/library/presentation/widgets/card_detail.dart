import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardDetailWidget extends StatelessWidget {
  final String label;
  final String content;

  const CardDetailWidget({
    super.key,
    required this.label,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.labelText,
        ),
        SizedBox(
          height: 3.h,
        ),
        Text(
          content,
          style: TextStyles.inputText,
          overflow: TextOverflow.clip,
        ),
        const Divider(
          thickness: 0.5,
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
