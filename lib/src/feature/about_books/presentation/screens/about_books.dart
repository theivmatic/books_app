import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:books_app/src/core/widgets/custom_appbar.dart';
import 'package:books_app/src/feature/about_books/presentation/widgets/article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutBooksScreen extends StatelessWidget {
  const AboutBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'О книгах',
        onPressed: () {},
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(20.dg),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => const ArticleWidget(),
        ),
      ),
    );
  }
}
