import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const BottomButtonWidget({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(
          AppColors.yellow,
        ),
        fixedSize: MaterialStatePropertyAll(
          Size(350.w, 50.h),
        ),
        elevation: const MaterialStatePropertyAll(0),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyles.bottomButtonText,
      ),
    );
  }
}
