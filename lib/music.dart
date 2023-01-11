import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'global.dart';

class Music extends StatefulWidget {
  const Music({Key? key}) : super(key: key);

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    assetsAudioPlayer.open(
      Audio('${song[musicIndex]['path']}'),
      autoStart: true,
      showNotification: true,
    );

    assetsAudioPlayer.currentPosition.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    assetsAudioPlayer.current.listen((totalDuration) {
      setState(() {
        duration = totalDuration!.audio.duration;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        height: height,
        width: width,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              "Music",
              style: TextStyle(
                color: CupertinoColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                letterSpacing: 0.8,
              ),
            ),
            const Spacer(),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 10,
              child: Container(
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    song[musicIndex]['image'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Text(
              song[musicIndex]['name'],
              style: const TextStyle(
                color: CupertinoColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              song[musicIndex]['des'],
              style: const TextStyle(
                color: Color(0xFFFFC2E0),
                fontSize: 20,
              ),
            ),
            const Spacer(),
            SliderTheme(
              data: const SliderThemeData(
                trackHeight: 1.5,
                thumbShape: RoundSliderThumbShape(
                    disabledThumbRadius: 0, enabledThumbRadius: 8),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
              ),
              child: Slider(
                activeColor: const Color(0xFFECC1CE),
                inactiveColor: const Color(0xFFB45F86),
                thumbColor: const Color(0xFFFEFFFE),
                value: position.inSeconds.toDouble(),
                max: duration.inSeconds.toDouble(),
                onChanged: (double value) async {
                  await assetsAudioPlayer
                      .seek(Duration(seconds: value.toInt()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${position.inMinutes.remainder(60)} : ${position.inSeconds.remainder(60)}",
                    style: const TextStyle(
                      color: CupertinoColors.white,
                    ),
                  ),
                  Text(
                    "${duration.inMinutes.remainder(60)} : ${duration.inSeconds.remainder(60)}",
                    style: const TextStyle(
                      color: CupertinoColors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (musicIndex > 0) {
                        musicIndex--;
                        assetsAudioPlayer.open(
                          Audio('${song[musicIndex]['path']}'),
                          autoStart: true,
                          showNotification: true,
                        );
                      }
                    });
                  },
                  child: const Icon(
                    CupertinoIcons.backward_fill,
                    color: CupertinoColors.white,
                    size: 40,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      assetsAudioPlayer.playOrPause();
                    });
                  },
                  child: Icon(
                    assetsAudioPlayer.isPlaying.value
                        ? CupertinoIcons.stop_fill
                        : CupertinoIcons.play_arrow_solid,
                    color: CupertinoColors.white,
                    size: 40,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (musicIndex < song.length - 1) {
                        musicIndex++;
                        assetsAudioPlayer.open(
                          Audio('${song[musicIndex]['path']}'),
                          autoStart: true,
                          showNotification: true,
                        );
                      }
                    });
                  },
                  child: const Icon(
                    CupertinoIcons.forward_fill,
                    color: CupertinoColors.white,
                    size: 40,
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}