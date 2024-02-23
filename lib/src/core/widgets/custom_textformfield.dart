import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String helperText;
  final TextEditingController controller;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.helperText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyles.inputText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyles.labelText,
        helperText: helperText,
        helperStyle: TextStyles.labelText,
      ),
    );
  }
}
