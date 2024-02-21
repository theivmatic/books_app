import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:flutter/material.dart';

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
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Text(
            tileText,
            style: TextStyles.settingTileText,
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: AppColors.yellow,
          ),
        ],
      ),
    );
  }
}
