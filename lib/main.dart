// import 'package:books_app/src/core/router/navigation.dart';

import 'package:books_app/src/core/bloc/observer.dart';
import 'package:books_app/src/core/screens/splash.dart';
import 'package:books_app/src/feature/library/domain/bloc/card_bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  Bloc.observer = AppObserver();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      builder: (context) => const MainApp(),
      enabled: false,
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CardBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
