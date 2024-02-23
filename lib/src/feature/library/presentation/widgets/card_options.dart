import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardOptionsWidget extends StatefulWidget {
  const CardOptionsWidget({super.key});

  @override
  State<CardOptionsWidget> createState() => _CardOptionsWidgetState();
}

class _CardOptionsWidgetState extends State<CardOptionsWidget> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(
        Icons.keyboard_control_rounded,
        color: AppColors.yellow,
        size: 25.dg,
      ),
      itemBuilder: (context) => [
        PopupMenuItem<Widget>(
          onTap: () {},
          child: Text(
            'Редактировать',
            style: TextStyles.popupItemText,
          ),
        ),
        PopupMenuItem<Widget>(
          onTap: () {},
          child: Text(
            'Удалить',
            style: TextStyles.popupItemText.copyWith(
              color: AppColors.red,
            ),
          ),
        ),
      ],
    );
  }
}
