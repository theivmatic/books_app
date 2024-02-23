import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:books_app/src/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class OpenedBooksScreen extends StatelessWidget {
  const OpenedBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Открытые книги',
        onPressed: () {},
      ),
      backgroundColor: AppColors.backgroundColor,
      body: const Center(
        child: Text('Opened books'),
      ),
    );
  }
}
