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
                  double max = 0;

                  if (myAudioController.isPlaying) {
                    max = myAudioController
                            .audioPlayer.current.value?.audio.duration.inSeconds
                            .toDouble() ??
                        100;
                  }

                  return Row(
                    children: [
                      Text("00:00"),
                      Expanded(
                        child: Slider(
                          min: 0,
                          max: max,
                          value: snapShot.data?.inSeconds.toDouble() ?? 0,
                          onChanged: (val) {},
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
