import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audioplayers/audioplayers.dart';

enum AudioEvent { play, pause, stop }

enum AudioStatus { stopped, playing, paused }

class AudioCubit extends Cubit<AudioStatus> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final String assetPath =
      'assets/song.mp3'; // Ajusta al path correcto de tu asset

  AudioCubit() : super(AudioStatus.stopped);

  void mapEventToState(AudioEvent event) async {
    switch (event) {
      case AudioEvent.play:
        await _audioPlayer.play(AssetSource('song.mp3'));
        emit(AudioStatus.playing);
        break;
      case AudioEvent.pause:
        await _audioPlayer.pause();
        emit(AudioStatus.paused);
        break;
      case AudioEvent.stop:
        await _audioPlayer.stop();
        emit(AudioStatus.stopped);
        break;
    }
  }

  @override
  Future<void> close() {
    _audioPlayer.dispose();
    return super.close();
  }
}
