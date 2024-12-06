import 'package:chat_app/config/dark_theme.dart';
import 'package:chat_app/features/chat/presentation/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'config/light_theme.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const MainApp()
  );
}

// Material class
class MainApp extends StatelessWidget{
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
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
