import 'package:chat_app/config/dark_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../config/light_theme.dart';
import '../presentation/pages/splash_page.dart';
import 'firebase_options.dart';

void main() async
{
  // firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // splash screen
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    const SplashScreen()
  );
  FlutterNativeSplash.remove();
}



// Material class
class SplashScreen extends StatelessWidget{
  const SplashScreen({super.key});
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

class MainApp extends StatelessWidget{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mr.Chat',
      theme: ThemeData(

      ),
    );
  }

}