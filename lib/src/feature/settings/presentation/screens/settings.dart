import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:books_app/src/core/constants/urls.dart';
import 'package:books_app/src/feature/settings/presentation/widgets/settings_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Настройки',
          style: TextStyles.appbarTitleText,
        ),
        centerTitle: false,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            children: [
              SettingsTileWidget(
                tileText: 'Политика конфиденциальности',
                onPressed: () {
                  launchUrl(
                    AppUrls.privacyPolicy,
                    mode: LaunchMode.externalApplication,
                  );
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              SettingsTileWidget(
                tileText: 'Пользовательское соглашение',
                onPressed: () {
                  launchUrl(
                    AppUrls.userAgreement,
                    mode: LaunchMode.externalApplication,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
