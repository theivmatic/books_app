import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:flutter/material.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Название статьи',
              style: TextStyles.appbarTitleText,
            ),
            Text(
              'Позаголовок статьи',
              style: TextStyles.labelText,
            ),
          ],
        ),
        centerTitle: false,
      ),
    );
  }
}
