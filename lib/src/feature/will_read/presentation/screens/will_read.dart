
import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WillReadScreen extends StatelessWidget {
  const WillReadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Прочитать в будущем'),
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
        child: Text('Will read'),
      ),
    );
  }
}
