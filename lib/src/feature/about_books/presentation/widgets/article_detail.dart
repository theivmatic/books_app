import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:flutter/material.dart';

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
    return Column(
      children: [
        Text(
          title,
          style: TextStyles.settingTileText,
        ),
        Text(
          content,
          style: TextStyles.inputText,
        ),
      ],
    );
  }
}
