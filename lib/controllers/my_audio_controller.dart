import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';

class MyAudioController {
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  Duration duration = Duration.zero;

  MyAudioController() {
    init();
  }

  Future<void> init() async {
    await audioPlayer
        .open(
      Audio(
        "lib/assets/audios/desh_rangila.mp3",
        metas: Metas(
          image: const MetasImage.network(
            "https://sm.mashable.com/t/mashable_in/photo/default/arijit-singh-copy_ddzh.1248.jpg",
          ),
          title: "Desh Rangila",
        ),
      ),
      autoStart: false,
      showNotification: true,
    )
        .then(
      (val) {
        duration = audioPlayer.current.value!.audio.duration;
      },
    );
  }

  Future<void> play() async {
    await audioPlayer.play();
  }

  Future<void> pause() async {
    await audioPlayer.pause();
  }

  Future<void> seek({required int seconds}) async {
    await audioPlayer.seek(
      Duration(seconds: seconds),
    );
  }

  getCurrentDuration() {}

  bool get isPlaying => audioPlayer.isPlaying.value;
}
