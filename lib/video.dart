import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:multimedia_app/global.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  int videoIndex;
  Video({Key? key, required this.videoIndex}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late VideoPlayerController videoPlayerController;
  late ChewieController cheWieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController = VideoPlayerController.network
      ('${video[widget.videoIndex]['video']}')..initialize().then((value) { setState((){}); });

    cheWieController = ChewieController(videoPlayerController: videoPlayerController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: (videoPlayerController.value.isInitialized)
              ? AspectRatio(
            aspectRatio: videoPlayerController.value.aspectRatio,
            child: Chewie(controller: cheWieController),
          )
              : const CircularProgressIndicator(),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
