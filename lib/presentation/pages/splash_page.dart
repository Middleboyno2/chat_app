import 'dart:ui';

import 'package:chat_app/services/cloudStorage.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/services/media.dart';
import 'package:chat_app/services/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SplashPage extends StatefulWidget {
  final VoidCallback onInitializationComplete;

  const SplashPage({super.key, required this.onInitializationComplete});

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _registerServices();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          // background
          Align(
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/background_splash_screen.png")
                )
              ),
            ),
          ),

          // // Lớp mờ 50%
          // Positioned.fill(
          //   child: BackdropFilter(
          //     filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          //     child: Container(
          //       color: Colors.black.withOpacity(0.5), // Màu overlay mờ
          //     ),
          //   ),
          // ),

          // logo
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 300,
              width: 300,
              // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                //color: Colors.white,
                // borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage("assets/logo.png")
                ),
              ),
            ),
          ),

          // branding
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              width: 200,
              // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                //color: Colors.white,
                // borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage("assets/branding.png")
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _registerServices() {
    GetIt.instance.registerSingleton<Navigation>(
      Navigation(),
    );
    GetIt.instance.registerSingleton<Media>(
      Media()
    );
    GetIt.instance.registerSingleton<CloudStorage>(
      CloudStorage()
    );
    GetIt.instance.registerSingleton<Database>(
        Database()
    );
  }
}


