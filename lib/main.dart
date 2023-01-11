import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'global.dart';
import 'login.dart';
import 'music.dart';
import 'splash.dart';
import 'homepage.dart';
import 'intro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isLogin = prefs.getBool('login') == true ? true : false;
  intro = prefs.getBool('intro') == true ? true : false;
  runApp(
    MaterialApp(
      theme: ThemeData(
          fontFamily: 'Iphone',
          textTheme: const TextTheme(
            bodyText2: TextStyle(
              letterSpacing: 0.5,
            ),
          )),
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        'splash': (context) => const Splash(),
        'intro': (context) => const IntroPage(),
        'login': (context) => const Login(),
        'home': (context) => const HomePage(),
        'music': (context) => const Music(),
      },
    ),
  );
}

