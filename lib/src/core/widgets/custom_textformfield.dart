import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String helperText;
  final TextEditingController? controller;
  final String? initialValue;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.helperText,
    this.controller,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
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
