import 'package:chat_app/config/dark_theme.dart';
import 'package:chat_app/features/chat/presentation/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'config/light_theme.dart';
import 'firebase_options.dart';

void main() async
{
  // firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // splash screen
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    const MainApp()
  );
  FlutterNativeSplash.remove();
}



// Material class
class MainApp extends StatelessWidget{
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Set default theme
      theme: lightTheme,
      // Set the dark theme for dark mode
      darkTheme: darkTheme,
      // Use system theme mode
      themeMode: ThemeMode.system,
      home: SplashPage(onInitializationComplete: (){})
    );
  }
}
