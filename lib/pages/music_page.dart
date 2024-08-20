import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:media_player_app/controllers/my_audio_controller.dart';

class MusicPage extends StatelessWidget {
  MusicPage({super.key});

  final MyAudioController myAudioController = MyAudioController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Music Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
                stream: myAudioController.audioPlayer.currentPosition,
                builder: (context, snapShot) {
                  double max = myAudioController.duration.inSeconds.toDouble();

                  return Row(
                    children: [
                      const Text("00:00"),
                      Expanded(
                        child: Slider(
                          min: 0,
                          max: myAudioController.duration.inSeconds.toDouble(),
                          value: snapShot.data?.inSeconds.toDouble() ?? 0,
                          onChanged: (val) {
                            log("$val/$max");
                            myAudioController.seek(
                              seconds: val.toInt(),
                            );
                          },
                        ),
                      ),
                      Text("${(max.toInt() / 60).toInt()}:${max.toInt() % 60}"),
                    ],
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    myAudioController.play();
                  },
                  icon: const Icon(Icons.play_arrow),
                ),
                IconButton(
                  onPressed: () {
                    myAudioController.pause();
                  },
                  icon: const Icon(Icons.pause),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
