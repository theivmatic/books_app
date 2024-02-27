import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;

  const SearchBarWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
        child: TextFormField(
          style: TextStyles.inputText,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.searchBackgroundColor,
            prefixIcon: const Icon(
              Icons.search,
            ),
            prefixIconColor: AppColors.searchIconColor,
            hintText: 'Поиск',
            hintStyle: TextStyles.bottomButtonText
                .copyWith(color: AppColors.searchIconColor),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
