import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_player_app/controllers/my_video_controller.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatelessWidget {
  VideoPage({super.key});

  MyVideoController videoController = Get.put(
    MyVideoController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: GetBuilder<MyVideoController>(
            builder: (controller) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    controller.myController.value.isInitialized
                        ? AspectRatio(
                            aspectRatio:
                                controller.myController.value.aspectRatio,
                            child: Chewie(
                              controller: controller.chewieController,
                            ),
                          )
                        : const CircularProgressIndicator(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            controller.myController.play();
                          },
                          icon: const Icon(Icons.play_arrow),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.myController.pause();
                          },
                          icon: const Icon(Icons.pause),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
