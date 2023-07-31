import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensors_plus/sensors_plus.dart';

class ShakeCubit extends Cubit<String> {
  final _random = Random();

  final StreamController<bool> _shakeController = StreamController<bool>();

  final List<String> _messages = [
    'Si',
    'No',
    'Tal vez',
    'Ni lo pienses!',
    'Vuelve a preguntar',
    'Podría ser',
    'Claro que sí',
    'Lo lamento',
    'Resultado positivo',
    'No lo creo',
  ];

  ShakeCubit() : super('') {
    accelerometerEvents.listen((AccelerometerEvent event) {
      if (event.x + event.y + event.z > 20) {
        shakeDetected();
      }
    });

    _shakeController.stream.listen((event) => shakeDetected());
  }

  void shakeDetected() async {
    final message = _messages[_random.nextInt(_messages.length)];
    emit(message);
    await Future.delayed(const Duration(seconds: 4));
    emit('');
  }

  void imageClicked() {
    _shakeController.add(true);
  }

  @override
  Future<void> close() {
    _shakeController.close();
    return super.close();
  }
}
