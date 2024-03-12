import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsTileWidget extends StatelessWidget {
  final String tileText;
  final VoidCallback onPressed;

  const SettingsTileWidget({
    super.key,
    required this.tileText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(
            5,
          ),
          shadowColor: const MaterialStatePropertyAll(
            AppColors.elevButtnShadow,
          ),
          fixedSize: MaterialStatePropertyAll(
            Size(
              350.w,
              60.h,
            ),
          ),
          backgroundColor: const MaterialStatePropertyAll(
            AppColors.white,
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tileText,
              style: TextStyles.settingTileText,
              overflow: TextOverflow.clip,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}
