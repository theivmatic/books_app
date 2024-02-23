import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

const font = GoogleFonts.montserrat;

abstract class AppColors {
  static const Color black = Color.fromRGBO(0, 0, 0, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color yellow = Color.fromRGBO(255, 204, 0, 1);
  static const Color grey = Color.fromRGBO(0, 0, 0, 0.3);
  static const Color red = Color.fromRGBO(255, 59, 48, 1);

  static const Color elevButtnShadow = Color.fromRGBO(0, 0, 0, 0.25);

  static const Color backgroundColor = Color.fromRGBO(0, 0, 0, 0.1);
}

abstract class TextStyles {
  static final appbarTitleText = font(
    textStyle: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 20.sp,
      color: AppColors.black,
    ),
  );
  static final navBarLabelText = font(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w600,
    ),
  );
  static final settingTileText = font(
    textStyle: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16.sp,
      color: AppColors.black,
    ),
  );
  static final bottomButtonText = font(
    textStyle: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16.sp,
      color: AppColors.white,
    ),
  );
  static final popupItemText = font(
    textStyle: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
      color: const Color.fromRGBO(0, 0, 0, 0.96),
    ),
  );
  static final labelText = font(
    textStyle: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 10.sp,
      color: AppColors.black,
    ),
  );
  static final inputText = font(
    textStyle: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
      color: AppColors.black,
    ),
  );
}
