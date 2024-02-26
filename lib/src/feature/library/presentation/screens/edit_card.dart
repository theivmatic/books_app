import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditCardScreen extends StatefulWidget {
  const EditCardScreen({super.key});

  @override
  State<EditCardScreen> createState() => _EditCardScreenState();
}

class _EditCardScreenState extends State<EditCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColors.yellow,
              size: 25.dg,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Наименование',
              style: TextStyles.appbarTitleText,
            ),
            Text(
              'Твоя библиотека',
              style: TextStyles.labelText,
            ),
          ],
        ),
        centerTitle: false,
      ),
      backgroundColor: AppColors.backgroundColor,
    );
  }
}
