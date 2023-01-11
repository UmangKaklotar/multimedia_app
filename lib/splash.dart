import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'intro.dart';
import 'login.dart';
import 'global.dart';
import 'homepage.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF3F5751),
              Color(0xFF851C51),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: AnimatedSplashScreen(
          backgroundColor: Colors.transparent,
          animationDuration: const Duration(seconds: 2),
          splashIconSize: 200,
          splash: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.music_note_rounded,
                size: 100,
                color: Colors.white,
              ),
              Text(
                "Music",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  letterSpacing: 0.8,
                ),
              ),
            ],
          ),
          nextScreen: isLogin == true
              ? const HomePage()
              : intro == true
                ? const Login()
                : const IntroPage(),
          splashTransition: SplashTransition.fadeTransition,
        ),
      ),
    );
  }
}