import 'package:books_app/src/core/router/navigation.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future<dynamic>.delayed(const Duration(seconds: 2)).then(
      (value) => Navigator.of(context).pushReplacement(
        MaterialPageRoute<dynamic>(
          builder: (context) => const Navigation(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
