import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const font = GoogleFonts.montserrat;

abstract class AppColors {
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color yellow = Color.fromRGBO(255, 204, 0, 1);
  static const Color grey = Color.fromRGBO(0, 0, 0, 0.3);
  static const Color red = Color.fromRGBO(255, 59, 48, 1);
}

abstract class TextStyles {
  static final navBarLabelText = font(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w600,
    ),
  );
}
