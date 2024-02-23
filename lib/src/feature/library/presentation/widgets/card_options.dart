import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:flutter/cupertino.dart';
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
          onTap: () {
            showCupertinoDialog<Widget>(
              barrierDismissible: true,
              context: context,
              builder: (_) => AlertDialog(
                actionsAlignment: MainAxisAlignment.spaceEvenly,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    12.r,
                  ),
                ),
                title: Text(
                  'Вы уверены, что хотите удалить карточку?',
                  style: TextStyles.popupItemText,
                ),
                actions: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Удалить',
                      style: TextStyles.popupItemText.copyWith(
                        color: AppColors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Отмена',
                      style: TextStyles.popupItemText,
                    ),
                  ),
                ],
              ),
            );
          },
          child: Text(
            'Удалить',
            style: TextStyles.popupItemText.copyWith(
              color: AppColors.red,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
