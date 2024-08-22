import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class MyVideoController extends GetxController {
  late VideoPlayerController myController;
  late ChewieController chewieController;

  MyVideoController() {
    init();
  }

  Future<void> init() async {
    myController = VideoPlayerController.asset("lib/assets/videos/video.mp4");
    await myController.initialize();

    chewieController = ChewieController(
      videoPlayerController: myController,
      autoPlay: false,
      aspectRatio: myController.value.aspectRatio,
      additionalOptions: (context) => [
        OptionItem(
          onTap: () => log("TAPPED..."),
          iconData: Icons.car_crash,
          title: "Car Crash",
        ),
      ],
    );

    update();
  }
}
