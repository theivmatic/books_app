import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:books_app/src/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

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
      body: const Center(
        child: Text('About books'),
      ),
    );
  }
}
