import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sore_app_with_firebase/firebase_options.dart';

import 'bindings/general_binding.dart';
import 'core/utils/theme/t_app_theme.dart';
import 'package:get/get.dart';

import 'data/repository/authentication/auth_repositry.dart';

void main() async {
  final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
  
  FlutterNativeSplash.preserve(widgetsBinding: binding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthenticationRepository()));
  
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
      initialBinding: GeneralBinding(),
      home: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
