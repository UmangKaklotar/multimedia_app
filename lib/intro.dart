import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:multimedia_app/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  pageDecoration() {
    return const PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyTextStyle: TextStyle(
        color: Color(0xFFFFC2E0),
        fontSize: 15,
      ),
      contentMargin: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
    );
  }

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
        child: IntroductionScreen(
          key: introKey,
          pages: [
            PageViewModel(
              title: 'Create Your Music',
              body:
              "Lorem Ipsum is simply dummy text of the printing\nand type setting industry. Lorem Ipsum has been the\nindustry's standard dummy text ever.",
              image: Image.asset(
                'build/song/intro1.png',
                height: 250,
              ),
              decoration: pageDecoration(),
            ),
            PageViewModel(
              title: 'Enjoy Your Music',
              body:
              "Lorem Ipsum is simply dummy text of the printing\nand type setting industry. Lorem Ipsum has been the\nindustry's standard dummy text ever.",
              image: Image.asset(
                'build/song/intro2.png',
                height: 250,
              ),
              decoration: pageDecoration(),
            ),
            PageViewModel(
              title: 'Share Your Playlists',
              body:
              "Lorem Ipsum is simply dummy text of the printing\nand type setting industry. Lorem Ipsum has been the\nindustry's standard dummy text ever.",
              image: Image.asset(
                'build/song/intro3.png',
                height: 250,
              ),
              decoration: pageDecoration(),
            ),
          ],
          done: const Text(
            "Done",
            style: TextStyle(
              color: Color(0xFFFFC2E0),
              fontSize: 15,
            ),
          ),
          onDone: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            setState(() {
              Navigator.pushReplacementNamed(context, 'login');
              intro = true;
              prefs.setBool('intro', intro);
            });
          },
          showSkipButton: true,
          showNextButton: true,
          skip: const Text(
            "Skip",
            style: TextStyle(
                color: Color(0xFFFFC2E0),
                fontSize: 15
            ),
          ),
          onSkip: () => introKey.currentState!.skipToEnd(),
          back: const Icon(
            Icons.arrow_back,
            color: Color(0xFFFFC2E0),
          ),
          next: const Icon(
            Icons.arrow_forward,
            color: Color(0xFFFFC2E0),
          ),
          skipOrBackFlex: 0,
          nextFlex: 0,
          dotsDecorator: DotsDecorator(
              color: const Color(0xffB30C61),
              activeColor: const Color(0xFFFFC2E0),
              size: const Size(10, 10),
              activeSize: const Size(22, 10),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24))),
          globalBackgroundColor: Colors.transparent,
          isProgressTap: false,
          freeze: false,
          animationDuration: 500,
        ),
      ),
    );
  }
}
