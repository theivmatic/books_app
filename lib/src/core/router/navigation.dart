import 'package:books_app/src/core/constants/app_theme.dart';
import 'package:books_app/src/feature/about_books/presentation/screens/about_books.dart';
import 'package:books_app/src/feature/library/presentation/screens/library.dart';
import 'package:books_app/src/feature/opened_books/presentation/screens/opened_books.dart';
import 'package:books_app/src/feature/settings/presentation/screens/settings.dart';
import 'package:books_app/src/feature/will_read/presentation/screens/will_read.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  static final List<Widget> screens = [
    const LibraryScreen(),
    const OpenedBooksScreen(),
    const WillReadScreen(),
    const AboutBooksScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        elevation: 0,

        //Label style
        iconSize: 24.h,
        selectedFontSize: 10.sp,
        unselectedFontSize: 10.sp,
        selectedItemColor: AppColors.yellow,
        unselectedItemColor: AppColors.grey,
        selectedLabelStyle: TextStyles.navBarLabelText,
        unselectedLabelStyle: TextStyles.navBarLabelText,
        showUnselectedLabels: true,

        //Items
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/navbar/book.png'),
            ),
            label: 'Библиотека',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/navbar/eyeglasses.png'),
            ),
            label: 'Открытые книги',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/navbar/bookmark.png'),
            ),
            label: 'Прочитать в будущем',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/navbar/lightbulb.png'),
            ),
            label: 'О книгах',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/navbar/gearshape.png'),
            ),
            label: 'Настройки',
          ),
        ],
      ),
    );
  }
}
