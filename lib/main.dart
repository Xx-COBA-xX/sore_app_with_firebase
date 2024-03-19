import 'package:flutter/material.dart';

import 'core/utils/theme/t_app_theme.dart';
import 'package:get/get.dart';

import 'feaures/authentication/screens/onboarding/onboarding_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppThemeData.lightTheme,
      darkTheme: TAppThemeData.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const OnBoardingScreen(),
    );
  }
}
