import 'package:audioplayers/audio_cache.dart';

var audio;
bool playing;
final player = AudioCache();

void startLoop() async {
  audio = await player.loop('timerider.mp3');
  playing = true;
}

void playnpause() {
  if (playing) {
    audio.stop();
    playing = false;
  } else {
    startLoop();
  }
}
