import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Твоя библиотека'),
        titleSpacing: 20.w,
        titleTextStyle: TextStyles.appbarTitleText,
        centerTitle: false,
        elevation: 5,
        shadowColor: AppColors.elevButtnShadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: FloatingActionButton(
              onPressed: () {},
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
      ),
      backgroundColor: AppColors.backgroundColor,
      body: const Center(
        child: Text('Library'),
      ),
    );
  }
}
