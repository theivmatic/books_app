import 'package:books_app/src/feature/settings/presentation/widgets/settings_tile.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SettingsTileWidget(
            tileText: 'Политика конфиденциальности',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
