import 'package:books_app/src/feature/about_books/presentation/screens/about_books.dart';
import 'package:books_app/src/feature/library/presentation/screens/library.dart';
import 'package:books_app/src/feature/opened_books/presentation/screens/opened_books.dart';
import 'package:books_app/src/feature/settings/presentation/screens/about_books.dart';
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
        iconSize: 24.h,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        elevation: 0,
        showUnselectedLabels: true,
        items: const [],
      ),
    );
  }
}
