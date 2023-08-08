// import 'package:audioplayers/audioplayers.dart';
// import 'package:bloc/bloc.dart';

// // Eventos
// abstract class AudioEvent {}

// class PlayPauseEvent extends AudioEvent {}

// // Estados
// enum AudioState { initial, playing, paused }

// class AudioStateBloc extends Bloc<AudioEvent, AudioState> {
//   AudioPlayer _audioPlayer;
//   final AudioCache _player = AudioCache();

//   AudioStateBloc() : super(AudioState.initial) {
//     _audioPlayer = _player.createPlayer();
//   }

//   @override
//   Stream<AudioState> mapEventToState(AudioEvent event) async* {
//     if (event is PlayPauseEvent) {
//       if (state == AudioState.playing) {
//         _audioPlayer.pause();
//         yield AudioState.paused;
//       } else {
//         _audioPlayer.resume();
//         yield AudioState.playing;
//       }
//     }
//   }

//   @override
//   Future<void> close() {
//     _audioPlayer.stop();
//     return super.close();
//   }
// }
