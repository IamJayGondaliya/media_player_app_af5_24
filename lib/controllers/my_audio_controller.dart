import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';

class MyAudioController {
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  MyAudioController() {
    init();
  }

  Future<void> init() async {
    await audioPlayer.open(
      Audio(
        "lib/assets/audios/desh_rangila.mp3",
      ),
      autoStart: false,
    );
  }

  Future<void> play() async {
    await audioPlayer.play();
  }

  Future<void> pause() async {
    await audioPlayer.pause();
  }

  getCurrentDuration() {}

  bool get isPlaying => audioPlayer.isPlaying.value;
}
